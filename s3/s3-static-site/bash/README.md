# S3 Static Site Manager

This project contains a set of modular Bash scripts to manage an AWS S3 bucket for static website hosting, including bucket creation, configuration, file uploads, and deletion.

---

## Overview

The main script `s3_static_site.sh` acts as a controller to invoke modular scripts performing specific tasks:

- `create_bucket.sh` — Creates an S3 bucket  
- `disable_block_public_access.sh` — Disables block public access settings  
- `configure_website.sh` — Configures the bucket for static website hosting  
- `apply_public_read_policy.sh` — Applies public read bucket policy  
- `upload_files.sh` — Uploads files or directories to the bucket  
- `validate_upload.sh` — Validates uploaded files  
- `delete_bucket.sh` — Deletes the bucket and all contents  

This modular approach allows reusability and easier maintenance.

---

## Prerequisites

- AWS CLI installed and configured with appropriate IAM credentials  
- Bash shell (Linux, macOS, or WSL on Windows)  
- AWS profile set up (or default credentials configured)  
- Internet access to AWS endpoints  

---

## Usage

Run the main script with the desired action and parameters:

```bash
./s3_static_site.sh [action] BUCKET_NAME REGION PROFILE [FILE_PATH]
```

## Actions


| Action      | Description                                                                                                                                  | FILE\_PATH Required?  |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| `create`    | Creates bucket, configures website, disables block public access, applies public read policy, uploads files (optional), and validates upload | Optional (for upload) |
| `configure` | Configures static website and applies public read policy                                                                                     | No                    |
| `upload`    | Uploads files or directory to the bucket and validates                                                                                       | Yes                   |
| `validate`  | Lists contents of the bucket to validate upload                                                                                              | No                    |
| `delete`    | Empties and deletes the bucket                                                                                                               | No                    |


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

## Notes

- Ensure your AWS CLI profile has sufficient permissions to perform S3 operations.
- Bucket names must be globally unique.
- The script disables Block Public Access settings and applies a public read policy for hosting; use responsibly.
- Validate uploads regularly to confirm successful deployments.


## License
MIT License
