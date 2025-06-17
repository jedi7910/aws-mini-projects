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

BUCKET_NAME="${1:-}"
REGION="${2:-}"
PROFILE="${3:-}"

if [[ -z "$BUCKET_NAME" || -z "$REGION" || -z "$PROFILE" ]]; then
  log_error "Usage: $0 BUCKET_NAME REGION PROFILE"
  exit 1
fi

log_info "Validating uploaded files in bucket: $BUCKET_NAME"

LISTING=$(aws s3 ls "s3://$BUCKET_NAME" --recursive --profile "$PROFILE" --region "$REGION" || true)

if [[ -z "$LISTING" ]]; then
  log_warn "⚠️ Bucket is empty. No files found in s3://$BUCKET_NAME"
else
  FILE_COUNT=$(echo "$LISTING" | wc -l)
  log_info "✅ Upload validation complete: $FILE_COUNT file(s) found."
  echo "$LISTING"
fi

STATIC_WEBSITE_URL="http://${BUCKET_NAME}.s3-website-${REGION}.amazonaws.com"
log_info "🌐 Static website URL: $STATIC_WEBSITE_URL"
