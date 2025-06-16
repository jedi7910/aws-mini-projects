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

# ⚙️ Alternative Infrastructure & Cloud Engineering Path (12-Month)

*This reflects my current thinking to lean on my infrastructure architect and Linux background, moving toward Cloud Infrastructure Engineer, Platform Engineer, or Cloud Engineer roles focusing on operations, monitoring, and automation — without heavy pre-sales or customer-facing duties.*

---

## 🎯 Goals

- Leverage existing infrastructure & Linux expertise
- Gain solid experience with cloud native monitoring & logging tools (Prometheus, Grafana, ELK)
- Master containerization basics (Docker, Kubernetes)
- Develop scripting and automation skills in Bash and Python (Python basics first)
- Build a portfolio targeting backend infrastructure/cloud engineering roles paying $150K+

---

## 📚 Phase 1: Core Cloud Infrastructure + Monitoring Fundamentals (Months 1–3)

| Mini Project | Folder | Description |
|--------------|--------|-------------|
| Prometheus + Grafana Setup | `05-security/monitoring-stack/` | Deploy Prometheus & Grafana on local VMs or cloud for basic metrics collection |
| ELK Stack Basic Setup | `05-security/logging/elk/` | Set up Elasticsearch, Logstash, Kibana for centralized logging |
| Basic Docker & Containers | `06-infrastructure-as-code/containers/` | Learn Dockerfile basics, container lifecycle |
| AWS SAA Completion | — | Complete AWS Solutions Architect Associate exam |

---

## 🧰 Phase 2: Intermediate Automation + Container Orchestration (Months 4–6)

| Mini Project | Folder | Description |
|--------------|--------|-------------|
| Kubernetes Intro | `06-infrastructure-as-code/kubernetes/` | Deploy simple K8s cluster using Minikube or managed service (EKS) |
| Infrastructure as Code | `06-infrastructure-as-code/terraform/` | Start Terraform basics for AWS resources |
| Bash & Python Scripting | `07-automation-scripts/` | Build scripts for automating EC2, S3 tasks |
| Monitoring Alerts | `05-security/monitoring-stack/alerts/` | Configure alerting rules in Prometheus/Grafana |

---

## 🔧 Phase 3: Full Cloud Infrastructure Projects + Advanced Automation (Months 7–12)

| Project | Folder | Description |
|---------|--------|-------------|
| Multi-AZ VPC Design + Terraform | `02-networking/terraform/` | Build a multi-AZ VPC with public/private subnets via Terraform |
| EKS Cluster + App Deployment | `06-infrastructure-as-code/kubernetes/eks-deploy/` | Set up EKS cluster and deploy sample app with monitoring |
| Centralized Logging & Alerting | `05-security/logging/elk/` | Integrate ELK stack with AWS CloudWatch Logs and alerts |
| CI/CD Pipeline Basics | `07-automation-scripts/cicd/` | Create simple CI/CD pipelines with GitHub Actions or Jenkins |
| Python Automation Enhancements | `07-automation-scripts/python/` | Automate cloud resource management with boto3 |

---

## 📂 Repo Structure Summary

```plain
.
├── 01-iam
├── 02-networking
│   └── terraform
├── 03-compute
│   └── cli-deploy
├── 04-storage
│   └── s3
│       ├── kms
│       └── s3-static-site
├── 05-security
│   ├── logging
│   └── monitoring-stack
├── 06-infrastructure-as-code
│   ├── containers
│   ├── kubernetes
│   │   └── eks-deploy
│   └── terraform
├── 07-automation-scripts
│   ├── bash
│   ├── cert-automation
│   ├── cicd
│   └── python
├── common
└── docs
```

## Scripts

All automation is handled via modular scripts located in the `scripts/` directory for each module. These scripts can be run individually or orchestrated through the main controller script to manage the S3 static site lifecycle.

For clarity, we refer to them simply as “scripts” throughout this project, though they are implemented as Bash shell scripts.


## 📎 Related Docs

- [AWS IAM Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)
- [AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
- [AWS Solutions Architect Associate Exam Guide](https://aws.amazon.com/certification/certified-solutions-architect-associate/)
- [Prometheus Documentation](https://prometheus.io/docs/introduction/overview/)
- [Grafana Documentation](https://grafana.com/docs/grafana/latest/)
- [ELK Stack Guide](https://www.elastic.co/guide/en/elastic-stack-get-started/current/get-started-elastic-stack.html)
