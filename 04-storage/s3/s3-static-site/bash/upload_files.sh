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

if [ -d "$FILE_PATH" ]; then
  echo "Uploading directory $FILE_PATH to S3..."
  aws s3 sync "$FILE_PATH" s3://"$BUCKET_NAME"/ --profile "$PROFILE" --region "$REGION"
else
  echo "Uploading file $FILE_PATH to S3..."
  aws s3 cp "$FILE_PATH" s3://"$BUCKET_NAME"/ --profile "$PROFILE" --region "$REGION"
fi

if [ $? -ne 0 ]; then
  echo "❌ Failed to upload files."
  exit 1
fi

echo "✅ Files uploaded successfully."
