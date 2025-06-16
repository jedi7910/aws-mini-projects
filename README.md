# 🚀 AWS Cloud Security Engineer/Architect Roadmap (12-Month)

This roadmap supports my transition from Infrastructure Architect at IBM to a backend-focused **Cloud Security Engineer or Cloud Security Architect** role — targeting secure cloud design, architecture, and automation using AWS.

---

## 🎯 Goals

- ✅ **Short-Term**: Focus on AWS Solutions Architect Associate (SAA-C03) certification using AWS Console for hands-on practice.
- 🎓 **Mid-Term**: After SAA, begin scripting-based projects (CLI, Bash, Python, IaC).
- 🔐 **Long-Term**: Earn AWS Security Specialty certification and build a strong GitHub portfolio with real-world AWS security projects.
- 💼 **Outcome**: Position for roles paying $185K+ that align with backend/cloud infrastructure and security design (no on-call, no deep dev).

---

## 📚 Phase 1: AWS SAA + Console-Based Mini Projects (Months 1–3)

> Certification + Console Skills + Early Portfolio

### ✅ Certification Focus
- AWS SAA-C03 via [learn.cantrill.io](https://learn.cantrill.io/)
- Track concepts via notes and flashcards

### 🧪 Hands-On Mini Projects (Console-Based)
| Project | Folder | Description |
|--------|--------|-------------|
| ✅ IAM AssumeRole (via Console) | `01-iam/assume-role-console/` | Cross-account access from GEN to PROD/DEV using trust relationships |
| ✅ S3 Static Site (via Console + Bash) | `04-storage/s3/s3-static-site/` | Static hosting with public access, KMS encryption, modular Bash scripts |
| 🔜 VPC/Subnet Setup (via Console) | `02-networking/` | Design and deploy VPC with public/private subnets |
| 🔜 EC2 & Security Groups (via Console) | `03-compute/` | Launch EC2 with secure access patterns |
| 🔜 KMS Key Mgmt (via Console) | `04-storage/s3/kms/` | Use KMS key for encrypting S3 resources |

---

## 🧰 Phase 2: Automation and CLI Projects (Months 4–6)

> Rebuild existing console projects using AWS CLI and scripts

| Project | Folder | Description |
|--------|--------|-------------|
| Rebuild AssumeRole Setup | `01-iam/assume-role-cli/` | Script all trust relationships and permissions using Bash + CLI |
| Rebuild Static Site | `04-storage/s3/s3-static-site/` | Full CLI/KMS automation (already started in `bash/`) |
| KMS Key Rotation Automation | `05-security/kms-rotation/` | Build a small KMS key rotation detector (CloudWatch + Lambda/Python or Bash) |
| EC2 Setup via CLI | `03-compute/cli-deploy/` | Create, secure, and tear down EC2 and SGs via script |

---

## 🔐 Phase 3: Advanced Security Projects + AWS Security Specialty (Months 7–12)

> Design-Focused, CLI-Enabled, Real-World Projects

| Project | Focus | Folder |
|--------|-------|--------|
| Org-Wide SCP Enforcement | AWS Organizations + SCPs | `01-iam/organizations-scp/` |
| Logging and Monitoring Stack | AWS Config, CloudTrail, GuardDuty | `05-security/monitoring-stack/` |
| Encryption Best Practices | SSE-KMS, CMK rotation, EBS volume encryption | `05-security/encryption-best-practices/` |
| IAM Least Privilege Framework | IAM Access Analyzer, Permissions Boundaries | `01-iam/least-privilege/` |
| Certificate Lifecycle Automation | TLS/SSL detection & rotation via Ansible/Nitro API | `07-automation-scripts/cert-automation/` |
| AWS Security Specialty Prep | Learn.Cantrill.io + Tutorials Dojo | `docs/security-specialty-notes.md` |

---

## 💡 Notes

- All early projects will focus on using **AWS Console first**, then be rebuilt with CLI/IaC in later phases.
- Each project folder should contain:
  - `README.md` with purpose, diagram (if needed), and screenshots
  - Scripted version (if applicable)
  - `screenshots/` subfolder (where needed)

---

## ✅ Current Status

- [x] Project Repo Set Up: `aws-mini-projects/`
- [x] IAM AssumeRole via Console (documented with screenshots)
- [x] S3 Static Site Project (with Bash scripts + KMS)
- [ ] VPC/Subnet (Console)
- [ ] EC2 Deployment (Console)
- [ ] CLI Rebuild Phase
- [ ] AWS SAA Exam Target: **[Fill in your target date]**
- [ ] AWS Security Specialty Study Starts: **After SAA**

---

## 📂 Folder Map (Linked)

- [`01-iam/`](./01-iam/) — Identity, AssumeRole, SCPs
- [`02-networking/`](./02-networking/) — VPC, Subnets
- [`03-compute/`](./03-compute/) — EC2, Security Groups
- [`04-storage/`](./04-storage/) — S3, KMS, Encryption
- [`05-security/`](./05-security/) — Logging, Monitoring, IAM Security
- [`06-infrastructure-as-code/`](./06-infrastructure-as-code/) — Terraform, CloudFormation (future)
- [`07-automation-scripts/`](./07-automation-scripts/) — Bash/Ansible tooling
- [`common/`](./common/) — Environment setup scripts, shared configs

---

## 📎 Related Docs

- [AWS IAM Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)
- [AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
- [AWS SAA Exam Guide](https://aws.amazon.com/certification/certified-solutions-architect-associate/)

---

## 🧠 Final Notes

This roadmap reflects a hybrid learning model focused on **console-based AWS exploration first**, followed by **hands-on scripting**. By layering design, security, and automation knowledge gradually, the transition to a high-value **Cloud Security Architect** or **Cloud Infrastructure Engineer** role is achievable within a year.
