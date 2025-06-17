#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Function to find the project root (where .git exists)
get_project_root() {
  local dir
  # Get the directory of this script, resolving symlinks
  dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
  # Traverse up until .git directory is found or root is reached
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

# Now you can safely source your shared libs relative to the project root
source "$PROJECT_ROOT/lib/logging.sh"

BUCKET_NAME=${1:-}
REGION=${2:-}
PROFILE=${3:-}

if [[ -z "$BUCKET_NAME" || -z "$REGION" || -z "$PROFILE" ]]; then
  log_error "Usage: $0 BUCKET_NAME REGION PROFILE"
  exit 1
fi

log_info "Configuring S3 Static Website Hosting for bucket $BUCKET_NAME..."

if aws s3api put-bucket-website \
  --bucket "$BUCKET_NAME" \
  --website-configuration '{
    "IndexDocument": {"Suffix": "index.html"},
    "ErrorDocument": {"Key": "error.html"}
  }' \
  --profile "$PROFILE" \
  --region "$REGION"
then
  log_info "✅ Static Website Hosting configured successfully."
else
  log_error "❌ Failed to configure S3 Static Website Hosting."
  exit 1
fi
