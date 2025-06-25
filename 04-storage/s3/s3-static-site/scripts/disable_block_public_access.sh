#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Function to find the project root (where .git exists)
get_project_root() {
  local dir
  dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
  while [[ "$dir" != "/" && ! -d "$dir/.git" ]]; do
    dir=$(dirname "$dir")
  done

  if [[ -d "$dir/.git" ]]; then
    echo "$dir"
  else
    echo "Error: Project root (.git folder) not found" >&2
    exit 1
  fi
}

PROJECT_ROOT=$(get_project_root)
source "$PROJECT_ROOT/lib/logging.sh"

# Input args
BUCKET_NAME=${1:-}
REGION=${2:-}
PROFILE=${3:-}

if [[ -z "$BUCKET_NAME" || -z "$REGION" || -z "$PROFILE" ]]; then
  log_error "Usage: $0 BUCKET_NAME REGION PROFILE"
  exit 1
fi

log_info "Checking if bucket $BUCKET_NAME exists..."
if ! aws s3api head-bucket --bucket "$BUCKET_NAME" --profile "$PROFILE" --region "$REGION" 2>/dev/null; then
  log_error "❌ Bucket $BUCKET_NAME does not exist or is inaccessible."
  exit 1
fi

log_info "Disabling Block Public Access settings for bucket $BUCKET_NAME..."

# Write config to a temp file (since inline JSON causes errors with AWS CLI here)
TEMP_JSON=$(mktemp)
cat <<EOF > "$TEMP_JSON"
{
  "BlockPublicAcls": false,
  "IgnorePublicAcls": false,
  "BlockPublicPolicy": false,
  "RestrictPublicBuckets": false
}
EOF

if aws s3api put-public-access-block \
  --bucket "$BUCKET_NAME" \
  --public-access-block-configuration file://"$TEMP_JSON" \
  --profile "$PROFILE" \
  --region "$REGION"; then
  log_info "✅ Block Public Access disabled."
else
  log_error "❌ Failed to update Block Public Access settings."
  rm -f "$TEMP_JSON"
  exit 1
fi

rm -f "$TEMP_JSON"
