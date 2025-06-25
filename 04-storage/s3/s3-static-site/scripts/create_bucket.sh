#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Function to find the project root (where .git exists)
get_project_root() {
  local dir
  # Get the directory of this script, resolving symlinks
  dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
  # Traverse up until .git directory is found or root is reached
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

# Now you can safely source your shared libs relative to the project root
source "$PROJECT_ROOT/lib/logging.sh"


BUCKET_NAME=${1:-}
REGION=${2:-}
PROFILE=${3:-}
KMS_KEY_ALIAS=${4:-}  # Optional

if [[ -z "$BUCKET_NAME" || -z "$REGION" || -z "$PROFILE" ]]; then
  log_error "Usage: $0 BUCKET_NAME REGION PROFILE [KMS_KEY_ALIAS]"
  exit 1
fi

log_info "Checking if bucket $BUCKET_NAME exists..."
if aws s3api head-bucket --bucket "$BUCKET_NAME" --profile "$PROFILE" 2>/dev/null; then
  log_info "Bucket $BUCKET_NAME already exists."
else
  log_info "Bucket $BUCKET_NAME does not exist. Creating bucket..."
  if [[ "$REGION" == "us-east-1" ]]; then
    aws s3api create-bucket --bucket "$BUCKET_NAME" --profile "$PROFILE"
  else
    aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" --create-bucket-configuration LocationConstraint="$REGION" --profile "$PROFILE"
  fi
  log_info "Bucket created."
fi

if [[ -n "$KMS_KEY_ALIAS" ]]; then
  log_info "Checking if KMS alias $KMS_KEY_ALIAS exists..."
  EXISTING_KEY_ID=$(aws kms list-aliases --profile "$PROFILE" --query "Aliases[?AliasName=='$KMS_KEY_ALIAS'].TargetKeyId" --output text)

  if [[ -z "$EXISTING_KEY_ID" || "$EXISTING_KEY_ID" == "None" ]]; then
    log_info "KMS alias $KMS_KEY_ALIAS does not exist. Creating new KMS key..."
    KEY_ID=$(bash "$(dirname "$0")/../kms/create-kms-key.sh" --alias "$KMS_KEY_ALIAS" --policy-file "$(dirname "$0")/../kms/policy.json" --username iamadmin --region "$REGION" --profile "$PROFILE")
    log_info "Created new KMS Key with ID: $KEY_ID"
  else
    KEY_ID=$EXISTING_KEY_ID
    log_info "Found existing KMS Key with ID: $KEY_ID"
  fi

  log_info "Configuring bucket encryption with KMS key ID: $KEY_ID"
  aws s3api put-bucket-encryption \
    --bucket "$BUCKET_NAME" \
    --server-side-encryption-configuration "{
      \"Rules\": [
        {
          \"ApplyServerSideEncryptionByDefault\": {
            \"SSEAlgorithm\": \"aws:kms\",
            \"KMSMasterKeyID\": \"$KEY_ID\"
          },
          \"BucketKeyEnabled\": true
        } 
      ]
    }" \
    --profile "$PROFILE"

  log_info "Bucket encryption configured with SSE-KMS."
else
  log_info "No KMS key alias provided; configuring bucket with SSE-S3 encryption (AES256)."
  aws s3api put-bucket-encryption \
    --bucket "$BUCKET_NAME" \
    --server-side-encryption-configuration "{
      \"Rules\": [
        {
          \"ApplyServerSideEncryptionByDefault\": {
            \"SSEAlgorithm\": \"AES256\"
          }
        }
      ]
    }" \
    --profile "$PROFILE"

  log_info "Bucket encryption configured with SSE-S3 (AES256)."
fi
