#!/bin/bash

BUCKET_NAME=$1
REGION=$2
PROFILE=$3

if [ -z "$BUCKET_NAME" ] || [ -z "$REGION" ] || [ -z "$PROFILE" ]; then
  echo "Usage: $0 BUCKET_NAME REGION PROFILE"
  exit 1
fi

echo "Emptying bucket $BUCKET_NAME..."

aws s3 rm s3://"$BUCKET_NAME" --recursive --profile "$PROFILE" --region "$REGION"

if [ $? -ne 0 ]; then
  echo "❌ Failed to empty the bucket."
  exit 1
fi

echo "Deleting bucket $BUCKET_NAME..."

aws s3api delete-bucket --bucket "$BUCKET_NAME" --profile "$PROFILE" --region "$REGION"

if [ $? -ne 0 ]; then
  echo "❌ Failed to delete bucket."
  exit 1
fi

echo "✅ Bucket deleted successfully."
