#!/bin/bash
set -euo pipefail

# Input Arguments
BUCKET_NAME="${1:-}"
REGION="${2:-}"
PROFILE="${3:-}"

# Validate required arguments
if [[ -z "$BUCKET_NAME" || -z "$REGION" || -z "$PROFILE" ]]; then
  echo "Usage: $0 BUCKET_NAME REGION PROFILE"
  exit 1
fi

# Validate files uploaded to bucket
echo "Validating uploaded files in bucket: $BUCKET_NAME"
LISTING=$(aws s3 ls "s3://$BUCKET_NAME" --recursive --profile "$PROFILE" --region "$REGION" || true)

if [[ -z "$LISTING" ]]; then
  echo "⚠️ Bucket is empty. No files found in s3://$BUCKET_NAME"
else
  FILE_COUNT=$(echo "$LISTING" | wc -l)
  echo "✅ Upload validation complete: $FILE_COUNT file(s) found."
  echo "$LISTING"
fi


STATIC_WEBSITE_URL="http://${BUCKET_NAME}.s3-website-${REGION}.amazonaws.com"
echo "🌐 Static website URL: $STATIC_WEBSITE_URL"
