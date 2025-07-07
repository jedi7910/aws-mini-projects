# ☁️ AWS Solutions Architect & Cloud Security Engineer Learning Roadmap

This GitHub portfolio supports my transition from an Infrastructure Architect at IBM into a **Cloud Security Engineer** and AWS Solutions Architect role. It focuses on hands-on mastery of AWS core services, infrastructure automation, and cloud-native security — preparing for certification and real-world security design challenges.

---

## 🎯 Goals

- Leverage 10+ years of infrastructure experience to specialize in **secure cloud architecture**
- Gain hands-on experience in **IAM hardening, encryption, monitoring, and secure automation**
- Build a portfolio of **security-first AWS deployments** using CLI, Terraform, and scripted workflows
- Earn AWS **Solutions Architect Associate** and **Security Specialty** certifications

---

## 🧭 Sprint Phase: Core AWS CLI Labs (0–3 Months)

| Lab                              | Folder                       | Tools Used        | Summary                                                        |
|---------------------------------|------------------------------|-------------------|----------------------------------------------------------------|
| VPC + EC2 CLI Bootstrap         | `00-labs/vpc-ec2-cli`        | AWS CLI, Bash     | Multi-AZ network and EC2 provisioning with tagging + IAM       |
| S3 Static Website (Encrypted)   | `00-labs/s3-static-cli`      | AWS CLI, KMS      | Secure S3 website with KMS encryption and bucket policies      |
| IAM AssumeRole Hands-On         | `00-labs/iam-assumerole-cli` | AWS CLI, JSON     | Secure cross-account role delegation using scripted policies   |

---

## 📚 Phase 1: Core AWS Infrastructure & Automation (Months 1–3)

| Project / Module                 | Folder                                 | Focus Area                          |
|--------------------------------|----------------------------------------|-------------------------------------|
| Terraform Core Modules          | `06-infrastructure-as-code/terraform`  | IaC for VPC, EC2, S3, and IAM       |
| Python + boto3 Automation       | `07-automation-scripts/python`         | Automated scanning + policy creation |
| Bash CLI Utilities              | `07-automation-scripts/bash`           | Scripted security operations        |
| Linux CLI Essentials            | `common/linux-refreshers`             | Secure configuration + auditing     |
| GitHub Actions CI/CD            | `07-automation-scripts/cicd`           | Compliance-aware IaC pipelines      |

---

## ⚙️ Phase 2: Secure Architecture Design (Months 4–6)

| Design Project                   | Folder                                  | Deliverables                        |
|----------------------------------|-----------------------------------------|-------------------------------------|
| Multi-AZ VPC and NAT Gateways    | `06-infrastructure-as-code/terraform/networking` | Secure network segmentation & routing |
| Security Best Practices          | `05-security`                            | KMS encryption, IAM policies, SCPs  |
| Serverless & Event-Based Alerts  | `03-compute/lambda`                      | Lambda functions for GuardDuty alerts |
| Cost Optimization                | `08-architecture-saa/cost-optimization` | Secure design trade-offs + budget   |
| High Availability & DR           | `08-architecture-saa/ha-dr`             | Backup encryption + failover        |

---

## 🏗️ Phase 3: Real-World Projects & Portfolio (Months 7–9)

| Project Name                     | Folder                                     | Description                        |
|---------------------------------|--------------------------------------------|------------------------------------|
| Resilient Multi-Tier App Design | `06-infrastructure-as-code/sample-architectures` | Scalable app with secure access controls |
| Centralized Logging & Monitoring| `06-infrastructure-as-code/observability`  | CloudTrail, GuardDuty, VPC Flow Logs |
| Infrastructure Automation       | `07-automation-scripts/`                   | Hardening automation with Terraform & Python |
| Comprehensive Notes & Diagrams  | `08-architecture-saa`                      | Security-focused diagrams + frameworks |

---

## 🔐 Phase 4: Security Engineering Labs & Cert Prep (Months 10–12)

| Lab / Topic                          | Folder                             | Skills Demonstrated                         |
|-------------------------------------|------------------------------------|---------------------------------------------|
| KMS Key Rotation + Envelope Encryption | `05-security/kms-key-lifecycle`    | CMK lifecycle, encryption context, usage policies |
| SCP Guardrails + Account Restrictions | `01-iam/scp-restrict-s3`           | Secure Org-level control with deny policies |
| IAM Boundary Policies + Permissions Guard | `01-iam/permissions-boundaries`    | Role/identity segmentation                  |
| GuardDuty + SNS Alerting            | `06-infrastructure-as-code/observability` | Threat detection pipeline setup             |
| Prep for AWS Security Specialty     | `docs/security-specialty-notes`    | Exam notes, diagrams, cheat sheets          |

---

## 🛠️ Linux & Security CLI Skills Refresher

| Topic              | Skill Area               | Location                        |
|--------------------|--------------------------|---------------------------------|
| SSH, Keys, Tunnels  | Secure Remote Access     | `common/linux-refreshers/ssh`  |
| SELinux + AppArmor  | Linux Hardening          | `common/linux-refreshers/selinux` |
| iptables, nftables, firewalld | Network Hardening       | `common/linux-refreshers/firewall` |
| Systemd & Journald  | Secure Service Mgmt      | `common/linux-refreshers/systemd` |
| Permissions & sudo  | Privilege Control        | `common/linux-refreshers/permissions` |
| Bash Scripting      | Automation for SecOps    | `common/linux-refreshers/bash` |

---

## 📂 Folder Structure

```bash
.
├── 00-labs
│   ├── iam-assumerole-cli
│   ├── s3-static-cli
│   └── vpc-ec2-cli
├── 01-iam
│   ├── assume-role-console
│   ├── scp-restrict-s3
│   └── permissions-boundaries
├── 02-networking
├── 03-compute
├── 04-storage
│   └── s3
│       ├── kms
│       └── s3-static-site
├── 05-security
│   └── kms-key-lifecycle
├── 06-infrastructure-as-code
│   ├── terraform
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
│       ├── firewall
│       ├── selinux
│       └── permissions
├── docs
│   └── security-specialty-notes


```
## Certifications
- AWS Solutions Architect - Associate (In Progress)
- AWS Security Specialty (Planned Post-SAA)


## AWS Services Covered
- IAM, Organizations, SCPs, Permissions Boundaries
- VPC, NACLs, Security Groups, NAT Gateways
- CloudTrail, GuardDuty, Config, SNS Alerts
- Lambda, CloudWatch, Terraform, Python boto3
- Linux Hardening, SELinux, iptables/nftables


---

## 📎 Related Documentation & References
- [AWS Certified Solutions Architect - Associate](https://aws.amazon.com/certification/certified-solutions-architect-associate/)
- [AWS Well Architected Framework](https://aws.amazon.com/architecture/well-architected/)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/)\
- [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Python boto3 SDK](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)

---

### 🔗 References
- [AWS Security Best Practices](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html)
- [AWS Security Specialty Certification Guide](https://aws.amazon.com/certification/certified-security-specialty/)
- [Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
- [CLI Docs](https://docs.aws.amazon.com/cli/latest/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Python boto3 SDK](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)



## 👋 Connect & Collaborate
Feel free to raise issues or submit pull requests for improvements or additional labs!