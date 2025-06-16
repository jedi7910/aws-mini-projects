#!/bin/bash

BUCKET_NAME=$1
REGION=$2
PROFILE=$3

if [ -z "$BUCKET_NAME" ] || [ -z "$REGION" ] || [ -z "$PROFILE" ]; then
  echo "Usage: $0 BUCKET_NAME REGION PROFILE"
  exit 1
fi

echo "Validating uploaded files..."

aws s3 ls s3://"$BUCKET_NAME" --profile "$PROFILE" --region "$REGION"
if [ $? -ne 0 ]; then
  echo "❌ Failed to list files."
  exit 1
fi

echo "✅ Upload validation complete."

# Display the static website URL
STATIC_WEBSITE_URL="http://${BUCKET_NAME}.s3-website-${REGION}.amazonaws.com"
echo "🌐 Static website URL: $STATIC_WEBSITE_URL"
