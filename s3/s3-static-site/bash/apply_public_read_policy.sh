#!/bin/bash

BUCKET_NAME=$1
PROFILE=$2
REGION=$3

if [ -z "$BUCKET_NAME" ] || [ -z "$PROFILE" ] || [ -z "$REGION" ]; then
  echo "Usage: $0 BUCKET_NAME PROFILE REGION"
  exit 1
fi

echo "Setting Bucket Policy for Public Read Access..."

POLICY=$(cat <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::$BUCKET_NAME/*"
    }
  ]
}
EOF
)

aws s3api put-bucket-policy \
  --bucket "$BUCKET_NAME" \
  --policy "$POLICY" \
  --profile "$PROFILE" \
  --region "$REGION"

if [ $? -ne 0 ]; then
  echo "❌ Failed to set Bucket Policy for Public Read Access."
  exit 1
fi

echo "✅ Public Read Access policy applied."
