# 🧪 Lab: S3 Static Site Hosting via AWS CLI

This lab demonstrates how to provision a static-hosted S3 site *using only the AWS CLI*. No console usage is allowed.

## 🛠️ Setup Steps

```bash
bash scripts/create_bucket.sh
bash scripts/disable_block_public_access.sh
bash scripts/apply_public_read_policy.sh
bash scripts/configure_website.sh
bash scripts/upload_files.sh
bash scripts/validate_upload.sh
