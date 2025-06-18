# S3 Static Website Hosting with KMS Encryption

This project provides modular Bash scripts to create and manage a static website hosted on AWS S3, with optional file upload and KMS encryption support.

---

## 📦 Overview

The main orchestrator script, `orchestrate_bucket.sh`, automates the entire workflow by invoking helper scripts for each step:

| Script                        | Purpose                                                                 |
|------------------------------|-------------------------------------------------------------------------|
| `create_bucket.sh`           | Creates an S3 bucket                                                    |
| `disable_block_public_access.sh` | Disables Block Public Access for the bucket                             |
| `configure_website.sh`       | Enables static website hosting on the bucket                           |
| `apply_public_read_policy.sh`| Applies a public read bucket policy                                     |
| `upload_files.sh`            | Uploads site files to the bucket (supports `.s3ignore`)                 |
| `validate_upload.sh`         | Lists files in the bucket to confirm a successful upload                |
| `delete_bucket.sh`           | Deletes the bucket and its contents                                    |

All logs are time-stamped and written to `logs/YYYY-MM-DD.log`.

---

## ✅ Features

- Static website configuration via AWS S3
- Optional file upload with `.s3ignore` support
- KMS encryption using existing or auto-created KMS alias
- Modular, reusable shell scripts
- Fully CLI-based; no AWS Console required

---

## 🧰 Prerequisites

- Bash shell (Linux, macOS, or WSL)
- AWS CLI installed and configured
- IAM permissions to manage S3 and optionally KMS
- An AWS CLI profile with the necessary access

---

## 🚀 Usage

```bash
./orchestrate_bucket.sh [action] BUCKET_NAME REGION PROFILE [FILE_PATH] [KMS_ALIAS]

```

### Arguments

| Argument      | Description                                                   |
| ------------- | ------------------------------------------------------------- |
| `action`      | One of: `create`, `configure`, `upload`, `validate`, `delete` |
| `BUCKET_NAME` | Globally unique name for your S3 bucket                       |
| `REGION`      | AWS region (e.g., `us-east-1`)                                |
| `PROFILE`     | AWS CLI profile name                                          |
| `FILE_PATH`   | (Optional) Directory to upload (used with `create`/`upload`)  |
| `KMS_ALIAS`   | (Optional) KMS key alias (e.g., `alias/my-storage-key`)       |
     |


## Examples
Create a new encrypted static website bucket and upload your site files:
```bash
./orchestrate_bucket.sh create my-test-bucket-kh1079 us-east-1 iamadmin-gen ./website_files alias/my-storage-key
```

Configure an existing bucket for static website hosting:
```bash
./orchestrate_bucket.sh configure my-test-bucket-kh1079 us-east-1 iamadmin-gen
```

Upload update files to your bucket:
```bash
./orchestrate_bucket.sh upload my-test-bucket-kh1079 us-east-1 iamadmin-gen ./website_files
```

Validate files are uploaded:
```bash
./orchestrate_bucket.sh validate my-test-bucket-kh1079 us-east-1 iamadmin-gen
```

Delete bucket and all its contents:
```bash
./orchestrate_bucket.sh delete my-test-bucket-kh1079 us-east-1 iamadmin-gen
```

## KMS Integration Details
- The `create` action ensures a KMS Customer Master Key (CMK) exists with the provided alias (e.g., alias/my-storage-key)
- Bucket encryption is configured to use this KMS key for server-side encryption (SSE-KMS)
- All uploaded objects will be encrypted by default using the KMS key
- Ensure your IAM profile has permissions for KMS actions on the key alias

## Notes on KMS Encryption

## Validation and Verification
After uploading your files, validate the upload and confirm your static website is accessible.

### Step 1: Validate Uploaded Files
Run:
```bash
./orchestrate_bucket.sh validate my-test-bucket-kh1079 us-east-1 iamadmin-gen
```
This lists bucket contents so you can verify your website files (index.html, error.html, CSS, JS, images, etc.) are present.

### Step 2: Verify Website Acessiblity
- Open the AWS S3 console
- Navigate to your bucket
- Go to the Properties tab > Static website hosting
- Use the displayed Endpoint URL to open your website in a browser

Example URL format:
```bash
http://my-test-bucket-kh1079.s3-website-us-east-1.amazonaws.com
```
If you see your homepage load, deployment was successful.

## Encryption Options: SSE-S3 vs SSE-KMS
This project supports two types of server-side encryption for your S3 bucket:

- **SSE-S3 (AES256):** Default encryption method if no KMS alias is provided. This uses AWS-managed keys and supports public static website hosting.

- **SSE-KMS:** Uses a customer-managed AWS KMS key identified by the alias you provide. This offers stronger encryption controls but **is not compatible with public static website hosting** due to S3 restrictions.
  

### Important:

- When using SSE-KMS encryption, objects **cannot be served publicly** via the static website endpoint. You may see errors such as:
 ```bash
     HTTP/1.1 400 Bad Request
     x-amz-error-code: InvalidRequest
     x-amz-error-message: The object was stored using a form of Server Side Encryption.
```
To avoid this:
- Use `--sse AES256 (SSE-S3)` instead if you require encryption.
- Or upload without encryption if the content is meant to be public.
- Ensure your IAM profile has proper permissions to use KMS keys if you choose SSE-KMS.

The upload script can be modified to automatically skip KMS or fallback to AES256 when deploying static websites.

## Notes on S3 Bucket Encryption with KMS
This project configures server-side encryption using AWS KMS keys. To reduce KMS request costs, S3 Bucket Keys are enabled where supported. Bucket Keys cache encryption keys at the bucket level, minimizing KMS API calls and helping lower your AWS bill.

If you modify the encryption settings, consider enabling `BucketKeyEnabled` in your bucket encryption configuration like so:
```json
{
  "Rules": [
    {
      "ApplyServerSideEncryptionByDefault": {
        "SSEAlgorithm": "aws:kms",
        "KMSMasterKeyID": "alias/my-storage-key"
      },
      "BucketKeyEnabled": true
    }
  ]
}
```

## .s3ignore Support
You can exclude unwanted files from upload by creating a .s3ignore file in your upload directory:
```text
.DS_Store
*.tmp
*.bak
Thumbs.db
ehthumbs.db
Desktop.ini
```
The upload script automatically excludes files matching these patterns

## Logging
The scripts include basic logging support `(lib/logging.sh)` and output logs to the `logs/` directory with timestamps for audit and troubleshooting.

## Repo Structure
```bash
04-storage/s3/s3-static-site/
├── policies/                      # Bucket and encryption policy templates  
├── scripts/                       # Modular Bash scripts for S3 and KMS operations  
│   ├── apply_public_read_policy.sh  
│   ├── config.sh  
│   ├── configure_website.sh  
│   ├── create_bucket.sh  
│   ├── create-kms-key.sh  
│   ├── delete_bucket.sh  
│   ├── disable_block_public_access.sh  
│   ├── orchestrate_bucket.sh     # Main orchestrator script  
│   ├── upload_files.sh  
│   └── validate_upload.sh  
```

## License
MIT License
