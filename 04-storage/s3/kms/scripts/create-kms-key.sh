#!/bin/bash
set -e

usage() {
  echo "Usage: $0 --alias ALIAS_NAME --policy-file POLICY_FILE [--username IAM_USERNAME] [--description DESCRIPTION] [--region REGION]" >&2
  echo >&2
  echo "  --alias           (required) Alias name for the KMS key, e.g. alias/my-key" >&2
  echo "  --policy-file     (required) Path to JSON file containing the key policy template" >&2
  echo "  --username        (optional) IAM username, default: iamadmin" >&2
  echo "  --description     (optional) Key description" >&2
  echo "  --region          (optional) AWS region, default: us-east-1" >&2
  exit 1
}

IAM_USERNAME="iamadmin"
KEY_DESCRIPTION=""
USER_REGION=""
KEY_ALIAS=""
POLICY_TEMPLATE_FILE=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --alias)
      shift
      KEY_ALIAS="$1"
      ;;
    --policy-file)
      shift
      POLICY_TEMPLATE_FILE="$1"
      ;;
    --username)
      shift
      IAM_USERNAME="$1"
      ;;
    --description)
      shift
      KEY_DESCRIPTION="$1"
      ;;
    --region)
      shift
      USER_REGION="$1"
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      ;;
  esac
  shift
done

if [[ -z "$KEY_ALIAS" ]]; then
  echo "Error: --alias is required." >&2
  usage
fi

if [[ -z "$POLICY_TEMPLATE_FILE" ]]; then
  echo "Error: --policy-file is required." >&2
  usage
fi

if [[ ! -f "$POLICY_TEMPLATE_FILE" ]]; then
  echo "Error: Policy file '$POLICY_TEMPLATE_FILE' not found." >&2
  exit 1
fi

if [[ -n "$USER_REGION" ]]; then
  export AWS_DEFAULT_REGION="$USER_REGION"
  echo "Using region from --region parameter: $AWS_DEFAULT_REGION" >&2
elif [[ -z "$AWS_DEFAULT_REGION" ]]; then
  export AWS_DEFAULT_REGION="us-east-1"
  echo "AWS_DEFAULT_REGION not set. Defaulting to us-east-1" >&2
else
  echo "Using AWS_DEFAULT_REGION from environment: $AWS_DEFAULT_REGION" >&2
fi

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
if [[ -z "$AWS_ACCOUNT_ID" ]]; then
  echo "Failed to retrieve AWS Account ID." >&2
  exit 1
fi

echo "AWS Account ID: $AWS_ACCOUNT_ID" >&2
echo "IAM Username: $IAM_USERNAME" >&2
echo "Alias: $KEY_ALIAS" >&2
echo "Description: ${KEY_DESCRIPTION:-<none>}" >&2
echo "AWS Region: $AWS_DEFAULT_REGION" >&2

TEMP_POLICY_FILE=$(mktemp)
sed \
  -e "s/{{ACCOUNT_ID}}/${AWS_ACCOUNT_ID}/g" \
  -e "s/{{IAM_USERNAME}}/${IAM_USERNAME}/g" \
  "$POLICY_TEMPLATE_FILE" > "$TEMP_POLICY_FILE"

echo "Creating KMS key..." >&2

if [[ -z "$KEY_DESCRIPTION" ]]; then
  KEY_ID=$(aws kms create-key --policy file://"$TEMP_POLICY_FILE" --query KeyMetadata.KeyId --output text)
else
  KEY_ID=$(aws kms create-key --description "$KEY_DESCRIPTION" --policy file://"$TEMP_POLICY_FILE" --query KeyMetadata.KeyId --output text)
fi

echo "KMS key created with KeyId: $KEY_ID" >&2

echo "Creating alias $KEY_ALIAS ..." >&2
aws kms create-alias --alias-name "$KEY_ALIAS" --target-key-id "$KEY_ID"

rm "$TEMP_POLICY_FILE"

# **CRUCIAL:** Output only the key ID on stdout for capturing
echo "$KEY_ID"
