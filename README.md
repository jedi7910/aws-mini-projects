# ☁️ AWS Solutions Architect Associate (SAA) 12-Month Learning Roadmap

This GitHub portfolio supports my transition from an Infrastructure Architect at IBM into an AWS Solutions Architect Associate role. The focus is hands-on mastery of AWS core services, secure and resilient architecture, infrastructure automation, and cloud best practices — preparing for certification and real-world design challenges.

---

## 🎯 Goals

- Leverage 10+ years of infrastructure experience with modern AWS cloud architecture  
- Build practical skills progressing from AWS CLI basics to Infrastructure as Code (IaC)  
- Develop reusable IaC modules, security best practices, and scalable cloud patterns  
- Master AWS core domains: compute, networking, storage, security, and high availability  

---

## 🧭 Sprint Phase: Core AWS CLI Labs (0–3 Months)

| Lab                              | Folder                       | Tools Used        | Summary                                                        |
|---------------------------------|------------------------------|-------------------|----------------------------------------------------------------|
| VPC + EC2 CLI Bootstrap         | `00-labs/vpc-ec2-cli`         | AWS CLI, Bash     | Manual VPC, subnets, and EC2 provisioning using AWS CLI       |
| S3 Static Website (Encrypted)   | `00-labs/s3-static-cli`       | AWS CLI, KMS      | Host a static website securely on S3 with encryption options  |
| IAM AssumeRole Hands-On          | `00-labs/iam-assumerole-cli`  | AWS CLI           | Cross-account AssumeRole setup using scripted CLI workflows   |

---

## 📚 Phase 1: Core AWS Infrastructure & Automation (Months 1–3)

| Project / Module                 | Folder                                 | Focus Area                          |
|--------------------------------|---------------------------------------|-----------------------------------|
| Terraform Core Modules          | `06-infrastructure-as-code/terraform` | IaC for VPC, EC2, S3, and IAM      |
| Python + boto3 Automation       | `07-automation-scripts/python`         | AWS SDK automation and resource scanning |
| Bash CLI Utilities              | `07-automation-scripts/bash`           | Scripting common AWS tasks         |
| Linux CLI Essentials            | `common/linux-refreshers`               | Linux basics relevant for AWS CLI  |
| GitHub Actions CI/CD            | `07-automation-scripts/cicd`           | Pipelines for infrastructure deployment |

---

## ⚙️ Phase 2: AWS Architectural Patterns & Design (Months 4–6)

| Design Project                   | Folder                                  | Deliverables                        |
|---------------------------------|-----------------------------------------|-----------------------------------|
| Multi-AZ VPC and Networking     | `06-infrastructure-as-code/terraform/networking` | Highly available networking designs |
| Security Best Practices         | `05-security`                            | KMS, IAM policies, encryption demos|
| Serverless Architectures        | `03-compute/lambda` (or create new)     | Lambda functions with event triggers|
| Cost Optimization               | `08-architecture-saa/cost-optimization` (new) | Cost comparison and budgeting examples |
| High Availability & Disaster Recovery | `08-architecture-saa/ha-dr` (new)        | Backup/restore, failover, RTO/RPO docs |

---

## 🏗️ Phase 3: Exam-Ready Project Portfolio (Months 7–12)

| Project Name                     | Folder                                     | Description                        |
|---------------------------------|--------------------------------------------|----------------------------------|
| Resilient Multi-Tier App Design | `06-infrastructure-as-code/sample-architectures` | Sample app with load balancing, autoscaling |
| Centralized Logging & Monitoring| `06-infrastructure-as-code/observability`  | CloudWatch, CloudTrail, ELK stack examples |
| Infrastructure Automation       | `07-automation-scripts/`                    | Ansible, Terraform, and Python integration |
| Comprehensive Exam Notes & Diagrams | `08-architecture-saa`                      | Well-Architected Framework & architecture diagrams |

---

## 🛠️ Linux & CLI Skills Refresher

| Topic              | Skill Area         | Location                    |
|--------------------|--------------------|-----------------------------|
| SSH, Keys, Tunnels  | Secure Remote Access| `common/linux-refreshers/ssh`|
| Systemd & Journald  | Service Management | `common/linux-refreshers/systemd` |
| Networking Tools    | TCP/IP & Diagnostics| `common/linux-refreshers/networking` |
| Permissions & Sudo  | Access Control     | `common/linux-refreshers/permissions` |
| Bash Scripting     | Automation Basics   | `common/linux-refreshers/bash` |

---

## 📂 Folder Structure

```bash
.
├── 00-labs
│   ├── iam-assumerole-cli
│   ├── s3-static-cli
│   └── vpc-ec2-cli
├── 01-iam
├── 02-networking
├── 03-compute
├── 04-storage
│   └── s3
│       ├── kms
│       └── s3-static-site
├── 05-security
├── 06-infrastructure-as-code
│   ├── terraform
│   │   ├── networking
│   │   ├── compute
│   │   └── storage
│   ├── observability
│   └── sample-architectures
├── 07-automation-scripts
│   ├── ansible
│   ├── bash
│   ├── cicd
│   └── python
├── 08-architecture-saa
│   ├── cost-optimization
│   ├── ha-dr
│   ├── well-architected-framework
│   └── sample-diagrams
├── common
│   └── linux-refreshers
├── docs
```

## AWS Services Covered
- EC2, VPC, IAM, S3, KMS, CloudWatch, CloudTrail
- Lambda, CloudFormation, Route53, ELB, Auto Scaling
- Terraform, Ansible, GitHub Actions, Python boto3
- Well-Architected Framework principles

## 📎 Related Documentation & References
[AWS Certified Solutions Architect - Associate](https://aws.amazon.com/certification/certified-solutions-architect-associate/)
[AWS Well Architected Framework](https://aws.amazon.com/architecture/well-architected/)
[AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/)\
[Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
[Python boto3 SDK](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)

## 👋 Connect & Collaborate
Feel free to raise issues or submit pull requests for improvements or additional labs!