#!/bin/bash
IFS=$'\n\t'
set -euo pipefail
# create_kms_key.sh
# Creates a KMS key and alias IF the alias does not already exist.
# If the alias exists, it reuses the existing key.
#
# Usage:
# ./create_kms_key.sh <alias> <profile> [description]
#
# Example:
# ./create_kms_key.sh alias/my-storage-key iamadmin-gen "My storage key"

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <alias> <profile> [description]"
  exit 1
fi

KEY_ALIAS=$1          # Alias to use, e.g. alias/my-storage-key
PROFILE=$2            # AWS CLI profile to use, e.g. iamadmin-gen
KEY_DESCRIPTION=${3:-""}  # Optional description for the KMS key

# Helper function for logging info messages
log_info() {
  echo "[INFO] $*"
}

# Build AWS CLI profile argument array if profile is set
PROFILE_ARG=()
if [[ -n "$PROFILE" ]]; then
  PROFILE_ARG=(--profile "$PROFILE")
fi

log_info "Checking if alias '$KEY_ALIAS' exists..."

# Check if the alias exists, get the key ID it points to
EXISTING_ALIAS_ID=$(aws "${PROFILE_ARG[@]}" kms list-aliases \
  --query "Aliases[?AliasName=='$KEY_ALIAS'].TargetKeyId" --output text)

if [[ -n "$EXISTING_ALIAS_ID" && "$EXISTING_ALIAS_ID" != "None" && "$EXISTING_ALIAS_ID" != "null" ]]; then
  # Alias exists, reuse the key ID
  log_info "Alias '$KEY_ALIAS' found and points to key: $EXISTING_ALIAS_ID"
  KEY_ID="$EXISTING_ALIAS_ID"
else
  # Alias does not exist, create a new KMS key
  log_info "Alias '$KEY_ALIAS' not found. Creating a new KMS key..."

  if [[ -z "$KEY_DESCRIPTION" ]]; then
    KEY_ID=$(aws kms create-key "${PROFILE_ARG[@]}" \
      --query KeyMetadata.KeyId --output text)
  else
    KEY_ID=$(aws kms create-key "${PROFILE_ARG[@]}" \
      --description "$KEY_DESCRIPTION" \
      --query KeyMetadata.KeyId --output text)
  fi

  log_info "Created new KMS key with KeyId: $KEY_ID"

  # Create the alias for the new key
  log_info "Creating alias '$KEY_ALIAS' for key '$KEY_ID'..."
  aws kms create-alias --alias-name "$KEY_ALIAS" --target-key-id "$KEY_ID" "${PROFILE_ARG[@]}"
  log_info "Alias '$KEY_ALIAS' created."
fi

# Final output of key ID
echo "KMS Key ID: $KEY_ID"
