#!/bin/bash

BUCKET_NAME=$1
REGION=$2
PROFILE=$3

if [ -z "$BUCKET_NAME" ] || [ -z "$REGION" ] || [ -z "$PROFILE" ]; then
  echo "Usage: $0 BUCKET_NAME REGION PROFILE"
  exit 1
fi

echo "Configuring S3 Static Website Hosting..."

aws s3api put-bucket-website \
  --bucket "$BUCKET_NAME" \
  --website-configuration '{
    "IndexDocument": {"Suffix": "index.html"},
    "ErrorDocument": {"Key": "error.html"}
  }' \
  --profile "$PROFILE" \
  --region "$REGION"

if [ $? -ne 0 ]; then
  echo "❌ Failed to configure S3 Static Website Hosting."
  exit 1
fi

echo "✅ Static Website Hosting configured."
