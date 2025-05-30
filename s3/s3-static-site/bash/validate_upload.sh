#!/bin/bash

BUCKET_NAME=$1
REGION=$2
PROFILE=$3

if [ -z "$BUCKET_NAME" ] || [ -z "$REGION" ] || [ -z "$PROFILE" ]; then
  echo "Usage: $0 BUCKET_NAME REGION PROFILE"
  exit 1
fi

echo "Validating uploaded files..."

aws s3 ls s3://"$BUCKET_NAME"/ --profile "$PROFILE" --region "$REGION"

if [ $? -ne 0 ]; then
  echo "❌ Failed to validate uploaded files."
  exit 1
fi

echo "✅ Files validated successfully."
