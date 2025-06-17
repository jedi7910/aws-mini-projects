#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Find project root by walking up to .git
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

BUCKET_NAME="${1:-}"
REGION="${2:-}"
PROFILE="${3:-}"
FILE_PATH="${4:-}"

if [[ -z "$BUCKET_NAME" || -z "$REGION" || -z "$PROFILE" || -z "$FILE_PATH" ]]; then
  log_error "Usage: $0 BUCKET_NAME REGION PROFILE FILE_PATH"
  exit 1
fi

if [[ ! -e "$FILE_PATH" ]]; then
  log_error "❌ The specified path does not exist: $FILE_PATH"
  exit 1
fi

FILE_PATH="$(realpath "$FILE_PATH")"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IGNORE_FILE="$SCRIPT_DIR/.s3ignore"
[[ ! -f "$IGNORE_FILE" && -f "$PROJECT_ROOT/.s3ignore" ]] && IGNORE_FILE="$PROJECT_ROOT/.s3ignore"

log_info "Uploading to bucket: $BUCKET_NAME (region: $REGION)"

if [[ -d "$FILE_PATH" ]]; then
  log_info "Uploading directory: $FILE_PATH"

  EXCLUDE_ARGS=()
  if [[ -f "$IGNORE_FILE" ]]; then
    log_info "Applying ignore rules from: $IGNORE_FILE"
    while IFS= read -r pattern || [[ -n "$pattern" ]]; do
      [[ -z "$pattern" || "$pattern" =~ ^# ]] && continue
      EXCLUDE_ARGS+=(--exclude "$pattern")
    done < "$IGNORE_FILE"
  fi

  aws s3 sync "$FILE_PATH" "s3://$BUCKET_NAME/" \
    --profile "$PROFILE" \
    --region "$REGION" \
    "${EXCLUDE_ARGS[@]}"
else
  log_info "Uploading single file: $FILE_PATH"
  aws s3 cp "$FILE_PATH" "s3://$BUCKET_NAME/" \
    --profile "$PROFILE" \
    --region "$REGION"
fi

log_info "✅ Upload complete."
log_info "🌐 Your static site should be available at:"
echo "http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
