#!/bin/bash
# S3 Bucket orchestration config - fill in before running scripts

BUCKET_NAME=""       # Name of the S3 bucket to create
REGION=""            # AWS region (e.g., us-east-1)
PROFILE=""           # AWS CLI profile to use
FILE_PATH=""         # Path to files to upload
KMS_KEY_ALIAS=""     # Optional KMS key alias for encryption

./scripts/orchestrate_bucket.sh create "$BUCKET_NAME" "$REGION" "$PROFILE" "$FILE_PATH" "$KMS_KEY_ALIAS"
