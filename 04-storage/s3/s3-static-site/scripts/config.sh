#!/bin/bash
BUCKET_NAME="my-static-site-kh1079"
REGION="us-east-1"
PROFILE="iamadmin-gen"
FILE_PATH="/mnt/c/AWS-SolutionArchitect/S3/static_website_hosting/static_website_hosting/website_files"
KMS_KEY_ALIAS="alias/my-storage-key"

./scripts/orchestrate_bucket.sh create "$BUCKET_NAME" "$REGION" "$PROFILE" "$FILE_PATH" "$KMS_KEY_ALIAS"
