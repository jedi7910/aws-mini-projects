#!/bin/bash
set -euo pipefail

# Input variables: Assign command-line arguments or default to empty
BUCKET_NAME=${1:-}
REGION=${2:-}
PROFILE=${3:-}

# Check if required arguments are provided; exit if any are missing
if [[ -z "$BUCKET_NAME" || -z "$REGION" || -z "$PROFILE" ]]; then
  echo "Usage: $0 BUCKET_NAME REGION PROFILE"
  exit 1
fi

echo "Checking if bucket $BUCKET_NAME exists..."

# Check if the S3 bucket exists and is accessible with given profile and region
# Suppress error output to avoid clutter
if ! aws s3api head-bucket --bucket "$BUCKET_NAME" --profile "$PROFILE" --region "$REGION" 2>/dev/null; then
  echo "Bucket $BUCKET_NAME does not exist or is inaccessible."
  exit 1
fi

echo "Emptying bucket $BUCKET_NAME..."

# Remove all objects and versions recursively from the bucket
if aws s3 rm "s3://$BUCKET_NAME" --recursive --profile "$PROFILE" --region "$REGION"; then
  echo "Bucket emptied successfully."
else
  echo "❌ Failed to empty the bucket."
  exit 1
fi

echo "Deleting bucket $BUCKET_NAME..."

# Delete the now empty bucket
if aws s3api delete-bucket --bucket "$BUCKET_NAME" --profile "$PROFILE" --region "$REGION"; then
  echo "✅ Bucket deleted successfully."
else
  echo "❌ Failed to delete bucket."
  exit 1
fi
