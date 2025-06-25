#!/bin/bash
set -euo pipefail

# Input arguments
BUCKET_NAME="${1:-}"
REGION="${2:-}"
PROFILE="${3:-}"
FILE_PATH="${4:-}"
ENCRYPTION_METHOD="${5:-}"  # Optional: 'kms', 'sse-s3', or empty for no encryption

# Validate required arguments
if [[ -z "$BUCKET_NAME" || -z "$REGION" || -z "$PROFILE" || -z "$FILE_PATH" ]]; then
  echo "Usage: $0 BUCKET_NAME REGION PROFILE FILE_PATH [ENCRYPTION_METHOD]"
  exit 1
fi

# Check if the specified file or directory exists
if [[ ! -e "$FILE_PATH" ]]; then
  echo "❌ The specified path does not exist: $FILE_PATH"
  exit 1
fi

# Convert FILE_PATH to an absolute path
FILE_PATH="$(realpath "$FILE_PATH")"

# Set the location of the .s3ignore file if present (for ignoring certain files during upload)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IGNORE_FILE="$SCRIPT_DIR/.s3ignore"
[[ ! -f "$IGNORE_FILE" && -f "$PROJECT_ROOT/.s3ignore" ]] && IGNORE_FILE="$PROJECT_ROOT/.s3ignore"

echo "Uploading to bucket: $BUCKET_NAME (region: $REGION)"
echo "Encryption method: ${ENCRYPTION_METHOD:-none}"

# Determine the appropriate SSE option for aws s3 commands
SSE_OPTION=""
if [[ "$ENCRYPTION_METHOD" == "kms" ]]; then
  SSE_OPTION="--sse aws:kms"
elif [[ "$ENCRYPTION_METHOD" == "sse-s3" ]]; then
  SSE_OPTION="--sse AES256"
fi

if [[ -d "$FILE_PATH" ]]; then
  echo "Uploading directory: $FILE_PATH"

  # Read ignore patterns from .s3ignore and build exclude arguments
  EXCLUDE_ARGS=()
  if [[ -f "$IGNORE_FILE" ]]; then
    echo "Applying ignore rules from: $IGNORE_FILE"
    while IFS= read -r pattern || [[ -n "$pattern" ]]; do
      # Skip empty lines and comments
      [[ -z "$pattern" || "$pattern" =~ ^# ]] && continue
      EXCLUDE_ARGS+=(--exclude "$pattern")
    done < "$IGNORE_FILE"
  fi

  # Sync directory contents to S3 bucket, applying exclude patterns and encryption
  aws s3 sync "$FILE_PATH" "s3://$BUCKET_NAME/" \
    --profile "$PROFILE" \
    --region "$REGION" \
    "${EXCLUDE_ARGS[@]}" \
    $SSE_OPTION
else
  echo "Uploading single file: $FILE_PATH"
  # Upload a single file with optional encryption
  aws s3 cp "$FILE_PATH" "s3://$BUCKET_NAME/" \
    --profile "$PROFILE" \
    --region "$REGION" \
    $SSE_OPTION
fi

echo "✅ Upload complete."
echo "🌐 Your static site should be available at:"
echo "http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
