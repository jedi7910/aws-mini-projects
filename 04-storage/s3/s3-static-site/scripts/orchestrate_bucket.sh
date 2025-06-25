#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Resolve script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to find the project root (where .git exists)
get_project_root() {
  local dir
  dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
  while [[ "$dir" != "/" && ! -d "$dir/.git" ]]; do
    dir=$(dirname "$dir")
  done

  if [[ -d "$dir/.git" ]]; then
    echo "$dir"
  else
    echo "Error: Project root (.git folder) not found" >&2
    exit 1
  fi
}

PROJECT_ROOT=$(get_project_root)
source "$PROJECT_ROOT/lib/logging.sh"

# Input validation
if [[ $# -lt 1 ]]; then
  log_error "Usage: $0 [create|configure|upload|validate|delete] BUCKET_NAME REGION PROFILE [FILE_PATH] [KMS_KEY_ALIAS]"
  exit 1
fi

ACTION=$1
BUCKET_NAME=${2:-}
REGION=${3:-}
PROFILE=${4:-}
FILE_PATH=${5:-}
KMS_KEY_ALIAS=${6:-}

log_info "Starting action: $ACTION"

# Function to ensure required params are provided
require_params() {
  for param in "$@"; do
    if [[ -z "$param" ]]; then
      log_error "Missing required parameter."
      exit 1
    fi
  done
}

case "$ACTION" in
  create)
    # Require minimum 3 params (bucket, region, profile), KMS alias optional
    require_params "$BUCKET_NAME" "$REGION" "$PROFILE"

    if [[ -n "$KMS_KEY_ALIAS" ]]; then
      log_info "Creating or ensuring KMS key with alias: $KMS_KEY_ALIAS"
      KMS_KEY_ID=$(
        bash "$SCRIPT_DIR/../../kms/scripts/create-kms-key.sh" \
          --alias "$KMS_KEY_ALIAS" \
          --policy-file "$SCRIPT_DIR/../../kms/policies/policy-template.json" \
          --username "iamadmin" \
          --description "KMS key for S3 bucket encryption" \
          --region "$REGION" \
          --profile "$PROFILE" \
        | grep -oP '(?<=KeyId: )[a-z0-9-]+'
      )

      if [[ -z "$KMS_KEY_ID" ]]; then
        log_error "❌ Failed to create or retrieve KMS Key ID"
        exit 1
      fi
      log_info "Using KMS Key ID: $KMS_KEY_ID"
    else
      log_info "No KMS alias provided, will use SSE-S3 encryption (AES256)."
      KMS_KEY_ALIAS=""
    fi

    bash "$SCRIPT_DIR/create_bucket.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" "$KMS_KEY_ALIAS"
    bash "$SCRIPT_DIR/disable_block_public_access.sh" "$BUCKET_NAME" "$REGION" "$PROFILE"
    bash "$SCRIPT_DIR/configure_website.sh" "$BUCKET_NAME" "$REGION" "$PROFILE"
    bash "$SCRIPT_DIR/apply_public_read_policy.sh" "$BUCKET_NAME" "$PROFILE" "$REGION"

    if [[ -n "$FILE_PATH" ]]; then
      log_info "Uploading files from $FILE_PATH ..."
      bash "$SCRIPT_DIR/upload_files.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" "$FILE_PATH"
      bash "$SCRIPT_DIR/validate_upload.sh" "$BUCKET_NAME" "$REGION" "$PROFILE"
    else
      log_warn "No FILE_PATH provided; skipping upload."
    fi
    ;;
  configure)
    require_params "$BUCKET_NAME" "$REGION" "$PROFILE"
    bash "$SCRIPT_DIR/disable_block_public_access.sh" "$BUCKET_NAME" "$REGION" "$PROFILE"
    bash "$SCRIPT_DIR/configure_website.sh" "$BUCKET_NAME" "$REGION" "$PROFILE"
    bash "$SCRIPT_DIR/apply_public_read_policy.sh" "$BUCKET_NAME" "$PROFILE" "$REGION"
    ;;
  upload)
    require_params "$BUCKET_NAME" "$REGION" "$PROFILE" "$FILE_PATH"
    bash "$SCRIPT_DIR/upload_files.sh" "$BUCKET_NAME" "$REGION" "$PROFILE" "$FILE_PATH"
    bash "$SCRIPT_DIR/validate_upload.sh" "$BUCKET_NAME" "$REGION" "$PROFILE"
    ;;
  validate)
    require_params "$BUCKET_NAME" "$REGION" "$PROFILE"
    bash "$SCRIPT_DIR/validate_upload.sh" "$BUCKET_NAME" "$REGION" "$PROFILE"
    ;;
  delete)
    require_params "$BUCKET_NAME" "$REGION" "$PROFILE"
    bash "$SCRIPT_DIR/delete_bucket.sh" "$BUCKET_NAME" "$REGION" "$PROFILE"
    ;;
  *)
    log_error "Invalid action: $ACTION"
    log_error "Valid actions: create, configure, upload, validate, delete"
    exit 1
    ;;
esac

log_info "✅ Action '$ACTION' completed successfully."
