#!/bin/bash

ACTION=$1
BUCKET_NAME=$2
REGION=$3
PROFILE=$4
FILE_PATH=$5
KMS_KEY_ALIAS=$6  # New parameter for optional KMS key alias (e.g. alias/my-storage-key)

if [ -z "$ACTION" ]; then
  echo "Usage: $0 [create|configure|upload|validate|delete] BUCKET_NAME REGION PROFILE [FILE_PATH] [KMS_KEY_ALIAS]"
  exit 1
fi

# Directory where your modular scripts live
SCRIPT_DIR="$(dirname "$0")"

case "$ACTION" in
  create)
    if [ -z "$KMS_KEY_ALIAS" ]; then
      echo "❌ KMS_KEY_ALIAS is required for create action."
      exit 1
    fi

    echo "Creating or ensuring KMS key with alias $KMS_KEY_ALIAS ..."
    KMS_KEY_ID=$(bash "$SCRIPT_DIR/../kms/create-kms-key.sh" \
      --alias "$KMS_KEY_ALIAS" \
      --policy-file "$SCRIPT_DIR/../kms/kms-key-policy.json" \
      --username "iamadmin" \
      --description "KMS key for S3 bucket encryption" \
      --region "$REGION" | grep -oP '(?<=KeyId: )[a-z0-9-]+')

    if [ -z "$KMS_KEY_ID" ]; then
      echo "❌ Failed to create or get KMS KeyId"
      exit 1
    fi

    echo "Using KMS Key ID: $KMS_KEY_ID"

    bash "$SCRIPT_DIR/create_bucket.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" "$KMS_KEY_ALIAS" || exit 1
    bash "$SCRIPT_DIR/disable_block_public_access.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" || exit 1
    bash "$SCRIPT_DIR/configure_website.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" || exit 1
    bash "$SCRIPT_DIR/apply_public_read_policy.sh" "$BUCKET_NAME" "$PROFILE" "$REGION" || exit 1

    if [ -n "$FILE_PATH" ]; then
      bash "$SCRIPT_DIR/upload_files.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" "$FILE_PATH" || exit 1
      bash "$SCRIPT_DIR/validate_upload.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" || exit 1
    fi
    ;;
  configure)
    bash "$SCRIPT_DIR/disable_block_public_access.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" || exit 1
    bash "$SCRIPT_DIR/configure_website.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" || exit 1
    bash "$SCRIPT_DIR/apply_public_read_policy.sh" "$BUCKET_NAME" "$PROFILE" "$REGION" || exit 1
    ;;
  upload)
    if [ -z "$FILE_PATH" ]; then
      echo "❌ Please provide FILE_PATH for upload."
      exit 1
    fi
    bash "$SCRIPT_DIR/upload_files.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" "$FILE_PATH" || exit 1
    bash "$SCRIPT_DIR/validate_upload.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" || exit 1
    ;;
  validate)
    bash "$SCRIPT_DIR/validate_upload.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" || exit 1
    ;;
  delete)
    bash "$SCRIPT_DIR/delete_bucket.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" || exit 1
    ;;
  *)
    echo "❌ Invalid action: $ACTION"
    echo "Valid actions: create, configure, upload, validate, delete"
    exit 1
    ;;
esac

echo "✅ Action '$ACTION' completed successfully."
