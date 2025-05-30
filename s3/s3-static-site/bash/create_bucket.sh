#!/bin/bash

BUCKET_NAME=$1
REGION=$2
PROFILE=$3

if [ -z "$BUCKET_NAME" ] || [ -z "$REGION" ] || [ -z "$PROFILE" ]; then
  echo "Usage: $0 BUCKET_NAME REGION PROFILE"
  exit 1
fi

echo "Checking if bucket $BUCKET_NAME exists..."

BUCKET_EXISTS=$(aws s3api head-bucket --bucket "$BUCKET_NAME" --profile "$PROFILE" --region "$REGION" 2>&1)

if [[ "$BUCKET_EXISTS" == *"Not Found"* ]]; then
  echo "Bucket does not exist. Creating bucket..."

  if [ "$REGION" == "us-east-1" ]; then
    aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" --profile "$PROFILE"
  else
    aws s3api create-bucket \
      --bucket "$BUCKET_NAME" \
      --region "$REGION" \
      --create-bucket-configuration LocationConstraint="$REGION" \
      --profile "$PROFILE"
  fi

  if [ $? -ne 0 ]; then
    echo "❌ Failed to create S3 bucket."
    exit 1
  fi

  echo "✅ S3 bucket created."
else
  echo "Bucket $BUCKET_NAME already exists."
fi
