#!/bin/bash

BUCKET_NAME=$1
REGION=$2
PROFILE=$3

if [ -z "$BUCKET_NAME" ] || [ -z "$REGION" ] || [ -z "$PROFILE" ]; then
  echo "Usage: $0 BUCKET_NAME REGION PROFILE"
  exit 1
fi

echo "Disabling Block Public Access settings..."

aws s3api put-public-access-block \
  --bucket "$BUCKET_NAME" \
  --public-access-block-configuration '{
    "BlockPublicAcls": false,
    "IgnorePublicAcls": false,
    "BlockPublicPolicy": false,
    "RestrictPublicBuckets": false
  }' \
  --profile "$PROFILE" \
  --region "$REGION"

if [ $? -ne 0 ]; then
  echo "❌ Failed to update Block Public Access settings."
  exit 1
fi

echo "✅ Block Public Access disabled."
