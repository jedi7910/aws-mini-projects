#!/bin/bash
set -euo pipefail

# Input args
BUCKET_NAME=${1:-}
REGION=${2:-}
PROFILE=${3:-}

if [[ -z "$BUCKET_NAME" || -z "$REGION" || -z "$PROFILE" ]]; then
  echo "Usage: $0 BUCKET_NAME REGION PROFILE"
  exit 1
fi

echo "Checking if bucket $BUCKET_NAME exists..."
if ! aws s3api head-bucket --bucket "$BUCKET_NAME" --profile "$PROFILE" --region "$REGION" 2>/dev/null; then
  echo "❌ Bucket $BUCKET_NAME does not exist or is inaccessible."
  exit 1
fi

echo "Disabling Block Public Access settings for bucket $BUCKET_NAME..."

# Write config to a temp file (since inline JSON causes errors with AWS CLI here)
TEMP_JSON=$(mktemp)
cat <<EOF > "$TEMP_JSON"
{
  "BlockPublicAcls": false,
  "IgnorePublicAcls": false,
  "BlockPublicPolicy": false,
  "RestrictPublicBuckets": false
}
EOF

if aws s3api put-public-access-block \
  --bucket "$BUCKET_NAME" \
  --public-access-block-configuration file://"$TEMP_JSON" \
  --profile "$PROFILE" \
  --region "$REGION"; then
  echo "✅ Block Public Access disabled."
else
  echo "❌ Failed to update Block Public Access settings."
  rm -f "$TEMP_JSON"
  exit 1
fi

rm -f "$TEMP_JSON"
