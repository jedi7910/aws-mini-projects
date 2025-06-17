#!/bin/bash
BUCKET_NAME=""
REGION=""
PROFILE=""
FILE_PATH=""
KMS_KEY_ALIAS=""

./scripts/orchestrate_bucket.sh create "$BUCKET_NAME" "$REGION" "$PROFILE" "$FILE_PATH" "$KMS_KEY_ALIAS"
