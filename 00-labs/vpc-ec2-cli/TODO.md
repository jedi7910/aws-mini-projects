# VPC + EC2 CLI Lab – Planning & Build Notes

> Working notes for designing, building, and later automating a resilient VPC and EC2 architecture using AWS CLI.

---

## ✅ Base Build Goals

- [ ] Custom VPC with CIDR (e.g., 10.0.0.0/16)
- [ ] 2 public subnets (in separate AZs)
- [ ] Internet Gateway + public route table
- [ ] EC2 instance with SSH access
- [ ] Security group for SSH/HTTP
- [ ] Key pair + public IP setup

---

## 🚀 Enhancements To Include

### ✅ Multi-AZ Design
- [ ] Subnets distributed across at least 2 AZs (e.g., us-east-1a, us-east-1b)
- [ ] AZ-specific subnet CIDRs (e.g., 10.0.1.0/24, 10.0.2.0/24)

### ✅ NAT Gateway & Private Subnets (Optional Stretch Goal)
- [ ] Add 2 private subnets in matching AZs
- [ ] Create NAT gateway in public subnet
- [ ] Private route table routes all `0.0.0.0/0` to NAT

### ✅ Tagging Policy
- [ ] Apply consistent tags to all resources:  
  Example: `Environment=Dev`, `Project=VpcLab`, `Owner=yourname`

### ✅ IAM Role with Scoped S3 Access
- [ ] Create IAM role for EC2
- [ ] Attach role to EC2 instance
- [ ] Use policy to allow access **only to specific S3 bucket**
- [ ] Verify role permissions via CLI from instance

### ✅ S3 Bucket with Encryption and Access Policy
- [ ] Create S3 bucket with:
  - [ ] Block public access
  - [ ] Server-side encryption enabled (SSE-S3 or SSE-KMS)
  - [ ] Bucket policy allowing only EC2 role access

---

## 🧪 Testing Steps

- [ ] SSH into EC2 instance
- [ ] Run `aws s3 ls` — confirm access only to expected bucket
- [ ] Verify internet access (via IGW or NAT)
- [ ] Validate tags appear in AWS Console

---

## 🧼 Cleanup Checklist

- [ ] Terminate EC2
- [ ] Delete subnets, route tables, IGW
- [ ] Delete NAT GW + EIP (if created)
- [ ] Delete S3 bucket (after removing objects)
- [ ] Delete IAM roles and policies

---

## 🧰 CLI Tools Used

- AWS CLI v2
- Optional: jq, bash scripts, credential profiles

## Architecture Summary
- 1 VPC with CIDR
- 2 public subnets (optional: + 2 private)
1 Internet Gateway (IGW)
Route Tables (with associations)
EC2 instance(s) in the public subnet
Security Group(s)

---

## 🔗 References

- [AWS VPC CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-vpc.html)
- [AWS NAT Gateway Docs](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)
- [IAM Role Docs](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html)
