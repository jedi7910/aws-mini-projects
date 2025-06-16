#!/bin/bash

BUCKET_NAME=$1
REGION=$2
PROFILE=$3
FILE_PATH=$4

if [ -z "$BUCKET_NAME" ] || [ -z "$REGION" ] || [ -z "$PROFILE" ] || [ -z "$FILE_PATH" ]; then
  echo "Usage: $0 BUCKET_NAME REGION PROFILE FILE_PATH"
  exit 1
fi

if [ ! -e "$FILE_PATH" ]; then
  echo "❌ The specified path does not exist."
  exit 1
fi

IGNORE_FILE="$(dirname "$0")/.s3ignore"

if [ -d "$FILE_PATH" ]; then
  echo "Uploading directory $FILE_PATH to S3..."
  
  if [ -f "$IGNORE_FILE" ]; then
    echo "Using ignore file: $IGNORE_FILE"
    aws s3 sync "$FILE_PATH" s3://"$BUCKET_NAME"/ \
      --exclude "*" \
      --include "*" \
      --profile "$PROFILE" \
      --region "$REGION" \
      $(while read -r pattern; do echo "--exclude \"$pattern\""; done < "$IGNORE_FILE")
  else
    aws s3 sync "$FILE_PATH" s3://"$BUCKET_NAME"/ --profile "$PROFILE" --region "$REGION"
  fi

else
  echo "Uploading file $FILE_PATH to S3..."
  aws s3 cp "$FILE_PATH" s3://"$BUCKET_NAME"/ --profile "$PROFILE" --region "$REGION"
fi

if [ $? -ne 0 ]; then
  echo "❌ Failed to upload files."
  exit 1
fi

# Display website endpoint after successful upload
ENDPOINT=$(aws s3api get-bucket-website --bucket "$BUCKET_NAME" --profile "$PROFILE" --region "$REGION" \
  --query '["http://" + BucketWebsiteConfiguration.IndexDocument.Suffix + "." + BucketWebsiteConfiguration.ErrorDocument.Key]' \
  --output text 2>/dev/null)

echo "✅ Files uploaded successfully."
echo "🌐 Your static website should be available at:"
echo "http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
