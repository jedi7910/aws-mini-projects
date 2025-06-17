#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

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

# Source logging functions
source "$PROJECT_ROOT/lib/logging.sh"

usage() {
  log_error "Usage: $0 --alias ALIAS_NAME --policy-file POLICY_FILE [--username IAM_USERNAME] [--description DESCRIPTION] [--region REGION] [--profile AWS_CLI_PROFILE]"
  exit 1
}

# Initialize variables with defaults
IAM_USERNAME="iamadmin"
KEY_DESCRIPTION=""
USER_REGION=""
KEY_ALIAS=""
POLICY_TEMPLATE_FILE=""
PROFILE=""

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --alias)
      shift; KEY_ALIAS="$1";;
    --policy-file)
      shift; POLICY_TEMPLATE_FILE="$1";;
    --username)
      shift; IAM_USERNAME="$1";;
    --description)
      shift; KEY_DESCRIPTION="$1";;
    --region)
      shift; USER_REGION="$1";;
    --profile)
      shift; PROFILE="$1";;
    *)
      log_error "Unknown argument: $1"
      usage;;
  esac
  shift
done

# Validate required params
if [[ -z "$KEY_ALIAS" ]]; then
  log_error "--alias is required."
  usage
fi
if [[ -z "$POLICY_TEMPLATE_FILE" ]]; then
  log_error "--policy-file is required."
  usage
fi
if [[ ! -f "$POLICY_TEMPLATE_FILE" ]]; then
  log_error "Policy file '$POLICY_TEMPLATE_FILE' not found."
  exit 1
fi

# Configure AWS region
if [[ -n "$USER_REGION" ]]; then
  export AWS_DEFAULT_REGION="$USER_REGION"
  log_info "Using region from --region parameter: $AWS_DEFAULT_REGION"
elif [[ -z "${AWS_DEFAULT_REGION:-}" ]]; then
  export AWS_DEFAULT_REGION="us-east-1"
  log_info "AWS_DEFAULT_REGION not set. Defaulting to us-east-1"
else
  log_info "Using AWS_DEFAULT_REGION from environment: $AWS_DEFAULT_REGION"
fi

# Setup AWS CLI profile argument
PROFILE_ARG=()
if [[ -n "$PROFILE" ]]; then
  PROFILE_ARG+=(--profile "$PROFILE")
  log_info "Using AWS CLI profile: $PROFILE"
fi

# Retrieve AWS account ID
AWS_ACCOUNT_ID=$(aws sts get-caller-identity "${PROFILE_ARG[@]}" --query Account --output text)
if [[ -z "$AWS_ACCOUNT_ID" ]]; then
  log_error "Failed to retrieve AWS Account ID."
  exit 1
fi

log_info "AWS Account ID: $AWS_ACCOUNT_ID"
log_info "IAM Username: $IAM_USERNAME"
log_info "Alias: $KEY_ALIAS"
log_info "Description: ${KEY_DESCRIPTION:-<none>}"
log_info "AWS Region: $AWS_DEFAULT_REGION"

# Render policy template
TEMP_POLICY_FILE=$(mktemp)
sed \
  -e "s/{{ACCOUNT_ID}}/${AWS_ACCOUNT_ID}/g" \
  -e "s/{{IAM_USERNAME}}/${IAM_USERNAME}/g" \
  "$POLICY_TEMPLATE_FILE" > "$TEMP_POLICY_FILE"

log_info "Creating KMS key..."

# Create KMS key
if [[ -z "$KEY_DESCRIPTION" ]]; then
  KEY_ID=$(aws kms create-key "${PROFILE_ARG[@]}" --policy file://"$TEMP_POLICY_FILE" --query KeyMetadata.KeyId --output text)
else
  KEY_ID=$(aws kms create-key "${PROFILE_ARG[@]}" --description "$KEY_DESCRIPTION" --policy file://"$TEMP_POLICY_FILE" --query KeyMetadata.KeyId --output text)
fi

log_info "KMS key created with KeyId: $KEY_ID"
log_info "Ensuring alias $KEY_ALIAS points to key $KEY_ID..."

# Check if alias exists
EXISTING_ALIAS_ID=$(aws "${PROFILE_ARG[@]}" kms list-aliases \
  --query "Aliases[?AliasName=='$KEY_ALIAS'].TargetKeyId" \
  --output text)

if [[ -z "$EXISTING_ALIAS_ID" ]]; then
  # Alias doesn’t exist, create it
  aws "${PROFILE_ARG[@]}" kms create-alias \
    --alias-name "$KEY_ALIAS" \
    --target-key-id "$KEY_ID"
  log_info "Alias $KEY_ALIAS created."
else
  # Alias exists
  if [[ "$EXISTING_ALIAS_ID" != "$KEY_ID" ]]; then
    log_warn "Alias $KEY_ALIAS already exists on a different key ($EXISTING_ALIAS_ID); consider deleting or updating it."
  else
    log_info "Alias $KEY_ALIAS already exists and points to this key."
  fi
fi


# Clean up
rm "$TEMP_POLICY_FILE"

echo "$KEY_ID"
