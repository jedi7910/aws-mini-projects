#!/bin/bash
set -e

BUCKET_NAME=$1
REGION=$2
PROFILE=$3
KMS_KEY_ALIAS=$4  # e.g. alias/my-storage-key (optional)

if [ -z "$BUCKET_NAME" ] || [ -z "$REGION" ] || [ -z "$PROFILE" ]; then
  echo "Usage: $0 BUCKET_NAME REGION PROFILE [KMS_KEY_ALIAS]"
  exit 1
fi

echo "Checking if bucket $BUCKET_NAME exists..."
if aws s3api head-bucket --bucket "$BUCKET_NAME" --profile "$PROFILE" 2>/dev/null; then
  echo "Bucket $BUCKET_NAME already exists."
else
  echo "Bucket $BUCKET_NAME does not exist. Creating bucket..."
  if [ "$REGION" == "us-east-1" ]; then
    aws s3api create-bucket --bucket "$BUCKET_NAME" --profile "$PROFILE"
  else
    aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" --create-bucket-configuration LocationConstraint="$REGION" --profile "$PROFILE"
  fi
  echo "Bucket created."
fi

if [ -n "$KMS_KEY_ALIAS" ]; then
  echo "Checking if KMS alias $KMS_KEY_ALIAS exists..."
  EXISTING_KEY_ID=$(aws kms list-aliases --profile "$PROFILE" --query "Aliases[?AliasName=='$KMS_KEY_ALIAS'].TargetKeyId" --output text)
  
  if [ -z "$EXISTING_KEY_ID" ] || [ "$EXISTING_KEY_ID" == "None" ]; then
    echo "KMS alias $KMS_KEY_ALIAS does not exist. Creating new KMS key..."
    KEY_ID=$(bash ./kms/create_kms_key.sh --alias "$KMS_KEY_ALIAS" --policy-file ./kms/policy.json --username iamadmin --region "$REGION")
    echo "Created new KMS Key with ID: $KEY_ID"
  else
    KEY_ID=$EXISTING_KEY_ID
    echo "Found existing KMS Key with ID: $KEY_ID"
  fi

  echo "Configuring bucket encryption with KMS key ID: $KEY_ID"
  aws s3api put-bucket-encryption \
    --bucket "$BUCKET_NAME" \
    --server-side-encryption-configuration "{
      \"Rules\": [
        {
          \"ApplyServerSideEncryptionByDefault\": {
            \"SSEAlgorithm\": \"aws:kms\",
            \"KMSMasterKeyID\": \"$KEY_ID\"
          }
        }
      ]
    }" \
    --profile "$PROFILE"

  echo "Bucket encryption configured."
else
  echo "No KMS key alias provided, skipping bucket encryption."
fi
