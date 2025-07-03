# ☁️ AWS Cloud Platform Engineer Roadmap (12-Month Track)

This portfolio supports my transition from an Infrastructure Architect at IBM into a Cloud Platform Engineer role focused on AWS. It emphasizes hands-on mastery of core AWS services, Infrastructure as Code (IaC), automation tooling, and secure, scalable architecture design — preparing for real-world engineering roles and certification.

---

## 🎯 Goals

- Leverage 10+ years of infrastructure experience to build secure AWS platforms  
- Master Infrastructure as Code (Terraform, Ansible), AWS CLI, and automation scripting  
- Design and deploy reusable cloud modules and observability pipelines  
- Implement high availability, disaster recovery, and cost-optimized infrastructure  
- Build a public, documented portfolio demonstrating platform engineering capabilities  

---

## 🧭 Sprint Phase: Core AWS CLI Labs (0–3 Months)

| Lab                              | Folder                       | Tools Used        | Summary                                                        |
|----------------------------------|------------------------------|-------------------|----------------------------------------------------------------|
| VPC + EC2 CLI Bootstrap         | `00-labs/vpc-ec2-cli`         | AWS CLI, Bash     | Manual VPC, subnets, and EC2 provisioning using AWS CLI       |
| S3 Static Website (Encrypted)   | `00-labs/s3-static-cli`       | AWS CLI, KMS      | Host a static website securely on S3 with encryption options  |
| IAM AssumeRole Hands-On         | `00-labs/iam-assumerole-cli`  | AWS CLI           | Cross-account AssumeRole setup using scripted CLI workflows   |

---

## 📚 Phase 1: Platform Engineering Fundamentals (Months 1–3)

| Project / Module                 | Folder                                 | Focus Area                          |
|----------------------------------|----------------------------------------|-------------------------------------|
| Terraform Core Modules          | `06-infrastructure-as-code/terraform`  | IaC for VPC, EC2, S3, and IAM       |
| Python + boto3 Automation       | `07-automation-scripts/python`         | AWS SDK automation and scanning     |
| Bash CLI Utilities              | `07-automation-scripts/bash`           | Scripted AWS tasks                  |
| GitHub Actions CI/CD Pipelines  | `07-automation-scripts/cicd`           | Infra deployments via GitHub Actions|
| Linux CLI Essentials            | `common/linux-refreshers`              | Linux skills for platform work      |

---

## ⚙️ Phase 2: Core Platform Projects (Months 4–6)

| Project Name                         | Folder                                  | Description                           |
|-------------------------------------|-----------------------------------------|---------------------------------------|
| Multi-AZ VPC with NAT + Routing     | `06-infrastructure-as-code/terraform/networking` | HA networking, NAT, tagging         |
| Scoped IAM + S3 Encryption Policies | `05-security` + `04-storage/s3/kms`     | Secure S3 access with encryption and IAM|
| Serverless Lambda Patterns          | `03-compute/lambda`                     | Events, triggers, logs, failover     |
| Cost Tagging & Budget Controls      | `08-architecture-saa/cost-optimization` | Track costs using tagging + alerts   |
| CloudWatch Observability Bundle     | `06-infrastructure-as-code/observability` | Metrics, logs, alerts                |

---

## 🏗️ Phase 3: Platform Deployment Portfolio (Months 7–12)

| Project Name                     | Folder                                     | Description                        |
|----------------------------------|--------------------------------------------|------------------------------------|
| Resilient Multi-Tier App Design | `06-infrastructure-as-code/sample-architectures` | LB, autoscaling, app & db tiers |
| GitOps-Based Platform Deployment| `07-automation-scripts/cicd`                | IaC deployment via PR pipeline     |
| Centralized Logging & Monitoring| `06-infrastructure-as-code/observability`  | Cloud-native observability stack   |
| DR Runbook + HA Patterns        | `08-architecture-saa/ha-dr`                | DR simulations, backups, RTO/RPO   |
| ADRs + Architecture Diagrams    | `08-architecture-saa`                      | Tradeoff docs, diagrams, narratives|


---


## 📂 Folder Structure

```bash
.
├── 00-labs
├── 01-iam
├── 02-networking
├── 03-compute
├── 04-storage
├── 05-security
├── 06-infrastructure-as-code
├── 07-automation-scripts
├── 08-architecture-saa
├── 08-architecture-saa
├── 09-cloud-security-specialization       <-- AWS post-cert security work
├── 10-oci-mini-projects                   <-- OCI cert labs + Terraform mirror
├── common
├── docs
├── lib
└── logs

```
## Certifications
- AWS Solutions Architect - Associate (In Progress)
- AWS Security Specialty (Planned Post-SAA)


## AWS Services Covered
- EC2, VPC, IAM, S3, KMS, CloudWatch, CloudTrail
- Lambda, CloudFormation, Route53, ELB, Auto Scaling
- Terraform, Ansible, GitHub Actions, Python boto3
- Well-Architected Framework principles

## ☁️ Oracle Cloud Infrastructure (OCI) Multi-Cloud Add-On

To complement my AWS learning and take advantage of Oracle’s free certification initiative (through October 2025), I’ve included a lightweight multi-cloud extension with select OCI certifications and hands-on projects.

### ✅ Certifications
- OCI Cloud Foundations Associate (In Progress)
- OCI AI Foundations Associate (Planned)
- OCI Architect Associate (Planned)
- OCI Architect Professional (Planned)
- OCI AI Services Professional (Planned)
- OCI Security Professional (Optional)

### 🛠️ Mini Projects

| Project Name                   | Folder                                  | Description                                                               |
|-------------------------------|-----------------------------------------|---------------------------------------------------------------------------|
| OCI Cloud Foundations Lab      | `10-oci-mini-projects/oci-foundations-vm` | Deployed a compute instance, NSGs, and object storage bucket using OCI console |
| OCI Terraform VM Provisioning  | `10-oci-mini-projects/oci-tf-vm`           | OCI version of AWS Terraform infra: compute, VCN, internet gateway         |

#### ⚙️ Optional OCI Mini Projects (Post-Certification)

| Project Name                   | Folder                                  | Description                                                               |
|-------------------------------|-----------------------------------------|---------------------------------------------------------------------------|
| OCI IAM & Compartments Policies | `10-oci-mini-projects/oci-iam-policies`  | Mirror AWS IAM AssumeRole work with OCI compartments and policies          |
| OCI Tagging & Budget Alerts     | `10-oci-mini-projects/oci-cost-controls`  | Demonstrate cost control and tagging similar to AWS cost optimization      |
| OCI Logging & Monitoring        | `10-oci-mini-projects/oci-logs-monitoring`| Set up OCI logging pipelines and object storage export mirroring AWS CloudWatch |


---

## 📎 Related Documentation & References
- [AWS Certified Solutions Architect - Associate](https://aws.amazon.com/certification/certified-solutions-architect-associate/)
- [AWS Well Architected Framework](https://aws.amazon.com/architecture/well-architected/)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/)\
- [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Python boto3 SDK](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)

---

## 🔐 Optional Phase 4: Cloud Security Specialization (Post-Certification)

After completing the AWS Solutions Architect Associate and gaining confidence with core AWS services, I plan to explore cloud security topics in greater depth to support secure-by-design infrastructure.

### 🛠 Topics of Interest
- IAM boundary policies, SCPs, and guardrails
- AWS KMS, Secrets Manager, and encryption best practices
- CloudTrail and GuardDuty for audit and threat detection
- Secure multi-account architecture design
- Security incident response in AWS

### 📦 Potential Folder (Coming Later)
`09-cloud-security-specialization/`  
- Real-world examples of implementing IAM hardening, encryption pipelines, and secure VPC design

### 🔗 References
- [AWS Security Best Practices](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html)
- [AWS Security Specialty Certification Guide](https://aws.amazon.com/certification/certified-security-specialty/)


## 👋 Connect & Collaborate
Feel free to raise issues or submit pull requests for improvements or additional labs!