# S3 Static Site Manager

This project contains a set of modular Bash scripts to manage an AWS S3 bucket for static website hosting. It includes bucket creation, configuration, file uploads, validation, and deletion.

---

## Overview

The main script, `s3_static_site.sh`, acts as a controller that invokes modular scripts for specific tasks:

- `create_bucket.sh` — Creates an S3 bucket  
- `disable_block_public_access.sh` — Disables Block Public Access settings  
- `configure_website.sh` — Configures the bucket for static website hosting  
- `apply_public_read_policy.sh` — Applies a public read bucket policy  
- `upload_files.sh` — Uploads files or directories to the bucket  
- `validate_upload.sh` — Validates uploaded files by listing bucket contents  
- `delete_bucket.sh` — Deletes the bucket and all its contents  

This modular approach enhances reusability and simplifies maintenance.

---

## Prerequisites

- AWS CLI installed and configured with appropriate IAM credentials  
- Bash shell (Linux, macOS, or WSL on Windows)  
- AWS CLI profile set up (or default credentials configured)  
- Internet access to AWS endpoints  

---

## Usage

Run the main script with the desired action and parameters:

```bash
./s3_static_site.sh [action] BUCKET_NAME REGION PROFILE [FILE_PATH]


## Avaliable Actions


| Action      | Description                                                                                                                              | FILE\_PATH Required?  |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| `create`    | Creates bucket, configures website, disables Block Public Access, applies public read policy, uploads files (optional), validates upload | Optional (for upload) |
| `configure` | Configures static website and applies public read policy                                                                                 | No                    |
| `upload`    | Uploads files or directory to the bucket and validates                                                                                   | Yes                   |
| `validate`  | Lists contents of the bucket to validate the upload                                                                                      | No                    |
| `delete`    | Empties and deletes the bucket                                                                                                           | No                    |
```


## Examples

Create a new static website bucket and upload your site files:
```bash
./s3_static_site.sh create my-static-site-bucket us-west-2 myawsprofile ./site-folder
```

Configure an existing bucket for static website hosting:
```bash
./s3_static_site.sh configure my-static-site-bucket us-west-2 myawsprofile
```

Upload updated files to your bucket:
```bash
./s3_static_site.sh upload my-static-site-bucket us-west-2 myawsprofile ./site-folder
```

Validate that files are uploaded:
```bash
./s3_static_site.sh validate my-static-site-bucket us-west-2 myawsprofile
```

Delete your bucket and all its contents:
```bash
./s3_static_site.sh delete my-static-site-bucket us-west-2 myawsprofile
```

## Validation & Verification

After uploading your files, it's important to verify that your static website is correctly deployed and accessible.

### Step 1: Validate Uploaded Files

You can run the validation script to list all files in your bucket and confirm the upload was successful:

```bash
./s3_static_site.sh validate my-static-site-bucket us-west-2 myawsprofile
```
This command lists the bucket contents so you can verify your website files (like index.html, error.html, CSS, JS, images, etc.) are present.

### Step 2: Verify Website Accessibility
- To confirm your site is accessible:
- Open the AWS S3 Console
- Navigate to your bucket
- Go to the Properties tab and find the Static website hosting section
- Use the Endpoint URL displayed to open your website in a browser

If you see your homepage load (usually index.html), the deployment is successful. If you encounter errors such as "NoSuchKey", double-check that index.html and any configured error documents are uploaded correctly.

You can also run commands as below:
```bash
aws s3api get-bucket-website --bucket my-static-site-bucket --profile myawsprofile
## take output url and run against curl 

curl -I http://my-static-site-bucket-kh1079.s3-website-us-east-1.amazonaws.com

## Output
HTTP/1.1 400 Bad Request
x-amz-error-code: InvalidRequest
x-amz-error-message: The object was stored using a form of Server Side Encryption. The correct parameters must be provided to retrieve the object.
x-amz-request-id: 02DMVE1K8FN7R0GM
x-amz-id-2: txLH12CS4I/22yX/zGcPEUmN4KRUfdL2/wm3Wb05HvdIZKGSLrPqKwgpYsb24EXmWql7c9XA44k=
Transfer-Encoding: chunked
Date: Mon, 16 Jun 2025 20:14:11 GMT
Connection: close
Server: AmazonS3
```
The SSE portion explains that you cannot serve objects in a bucket publically that are encrypted 

## Ignore Rules (Optional)
You can create a .s3ignore file in the same directory as your upload scripts to exclude system or unwanted files from upload. Example:
```bash
.DS_Store
*.tmp
*.bak
Thumbs.db
ehthumbs.db
Desktop.ini
```
The upload script automatically reads .s3ignore if present.



## Notes

- Ensure your AWS CLI profile has sufficient permissions to perform S3 operations.
- Bucket names must be globally unique.
- The script disables Block Public Access settings and applies a public read policy for hosting; use responsibly.
- Validate uploads regularly to confirm successful deployments.
- .s3ignore is supported for excluding unwanted files during upload.

## License
MIT License
