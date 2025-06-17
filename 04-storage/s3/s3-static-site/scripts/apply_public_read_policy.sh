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
PROFILE=${2:-}
REGION=${3:-}

if [[ -z "$BUCKET_NAME" || -z "$PROFILE" || -z "$REGION" ]]; then
  log_error "Usage: $0 BUCKET_NAME PROFILE REGION"
  exit 1
fi

log_info "Setting Bucket Policy for Public Read Access on bucket $BUCKET_NAME..."

POLICY=$(cat <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::$BUCKET_NAME/*"
    }
  ]
}
EOF
)

if aws s3api put-bucket-policy --bucket "$BUCKET_NAME" --policy "$POLICY" --profile "$PROFILE" --region "$REGION"; then
  log_info "✅ Public Read Access policy applied successfully."
else
  log_error "❌ Failed to set Bucket Policy for Public Read Access."
  exit 1
fi
