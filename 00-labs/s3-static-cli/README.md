# 🧪 S3 Static Site (CLI-Only Lab)

This lab demonstrates how to provision a public, static website hosted on Amazon S3 — using **only AWS CLI** commands. It supports optional encryption via **SSE-S3** or **SSE-KMS**.
> 📘 This is a mini hands-on lab to practice AWS S3 static website hosting using the AWS CLI.  
> It supports both SSE-S3 and SSE-KMS encryption and reflects foundational platform engineering skills with a focus on CLI operations over automation.


---

## 🧱 Project Structure

```bash
00-labs/s3-static-cli/
├── README.md
├── scripts/
│   ├── apply_public_read_policy.sh
│   ├── configure_website.sh
│   ├── create_bucket.sh
│   ├── delete_bucket.sh
│   ├── disable_block_public_access.sh
│   ├── upload_files.sh
│   └── validate_upload.sh
└── templates/
    ├── bucket-policy-template.json
    └── public-read-policy.json
```

## Requirements
- AWS CLI v2 installed and configured
- IAM permissions to manage S3, KMS (optional) and bucket policies
- A valid AWS CLI profile with access

## 🛠️ Script Workflow
Run the following in order (substitute values accordingly):
### 1. Create the bucket
```bash
./scripts/create_bucket.sh my-bucket us-east-1 my-profile
```
Optional: add alias/my-key as the 4th argument for SSE-KMS support.

### 2. Disable Block Public Access
```bash
./scripts/disable_block_public_access.sh my-bucket us-east-1 my-profile
```

### 3. Enable website hosting
```bash
./scripts/configure_website.sh my-bucket us-east-1 my-profile
```

### 4. Apply Public Read Access
```bash
./scripts/apply_public_read_policy.sh my-bucket my-profile us-east-1
```

### 5. Upload Website Files
```bash
./scripts/upload_files.sh my-bucket us-east-1 my-profile ./site sse-s3
```

### 6. Validate contents
```bash
./scripts/validate_upload.sh my-bucket us-east-1 my-profile
```

### 7. (Optional) Delete Everything
```bash
./scripts/delete_bucket.sh my-bucket us-east-1 my-profile
```

## 🔐 Encryption Options
| Method  | CLI Param | Public Access | Notes                        |
| ------- | --------- | ------------- | ---------------------------- |
| SSE-S3  | `sse-s3`  | ✅ Yes         | Safe for public hosting      |
| SSE-KMS | `kms`     | ❌ No          | Blocks public website access |


## 🔎 Validation
- Uploaded files are listed via aws s3 ls.
- A public website URL is printed for verification.


## 🚫 Known Limitations
- SSE-KMS will break public access to website files and possibly incur charges
- Buckets must have globally unique names.

## 📎 Related AWS Docs
[S3 Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html) 
[S3 Bucket Policies](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html)
[SSE-S3 vs SSE-KMS](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingServerSideEncryption.html)

## 🧼 Cleanup Reminder
Don't forget to delete your test buckets after completing the lab:
```bash
./scripts/delete_bucket.sh my-bucket us-east-1 my-profile
```