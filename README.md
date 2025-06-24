# 🚀 Platform Engineering & SRE Career Roadmap (12-Month)

This GitHub portfolio supports my transition from an Infrastructure Architect at IBM into a Platform Engineering or Site Reliability Engineering (SRE) role. My focus is backend delivery: automating infrastructure, improving resiliency, enabling observability, and implementing secure cloud-native architecture using AWS, Terraform, Ansible, and Python.

> 💡 Designed for backend-heavy, non-customer-facing roles with flexible or daylight-only on-call.

---

## 🎯 Goals

- Leverage 10+ years of infrastructure & Linux experience in modern DevOps/SRE practices  
- Learn AWS cloud infrastructure from hands-on CLI → IaC progression  
- Build modular scripts & IaC blueprints to enable team delivery  
- Master core SRE skills: automation, observability, infrastructure resilience, platform security  
- Target $160K–$175K+ Platform/SRE roles within 6–9 months  

---

## 🧭 Sprint Phase: EC2 + VPC → Automation Projects (0–3 Months)

### 🧪 AWS Labs (Post-Module Practice)

| Lab                               | Folder                        | Tools Used         | Summary |
|----------------------------------|------------------------------|--------------------|---------|
| VPC + EC2 CLI Bootstrap          | `00-labs/vpc-ec2-cli`         | AWS CLI, Bash      | Manually create VPC, subnets, EC2 instances via CLI after completing Cantrill VPC/EC2 training |
| S3 Secure Static Site via CLI    | `00-labs/s3-static-cli`       | AWS CLI, KMS       | Upload encrypted HTML to a public static site (CLI-only, no console) |
| IAM AssumeRole Hands-On          | `00-labs/iam-assumerole-cli`  | AWS CLI            | Use scripted cross-account AssumeRole pattern with minimal console usage |

---

## 📚 Phase 1: Core Infrastructure + Automation Foundation (Months 1–3)

| Project/Module                     | Folder                                      | Focus Area                    |
|-----------------------------------|---------------------------------------------|-------------------------------|
| Prometheus + Grafana Mini Stack   | `06-infrastructure-as-code/observability/` | Monitoring/metrics             |
| Docker Fundamentals               | `06-infrastructure-as-code/containerization/` | Container skills             |
| Python boto3 + Bash Scripting     | `07-automation-scripts/`                    | AWS automation & CLI scripting |
| - S3 Bucket Scanner (boto3)       | `07-automation-scripts/python/security/`   | Scan buckets for encryption, permissions, and public access            |
| - IAM Policy Analyzer (boto3)     | `07-automation-scripts/python/security/`   | Analyze and report on IAM policies for least privilege adherence       |
| - Security Alert Webhook Sender   | `07-automation-scripts/python/security/`   | Send notifications for security events via SNS or webhook              |
| Terraform Modules: EC2, S3, VPC   | `06-infrastructure-as-code/terraform/`      | IaC foundations               |
| Linux Refreshers                  | `common/linux-refreshers/`                   | Permissions, ssh, tmux, journald, systemctl, networking |
| GitHub Actions Hello World CI     | `07-automation-scripts/cicd/`                | Lightweight pipeline setup    |
| AWS SAA (In Progress)             | —                                           | Core AWS services (continue Cantrill course) |

---

## ⚙️ Phase 2: Platform Engineering Patterns (Months 4–6)

| Design Project                     | Folder                                           | Deliverables                                                      |
|-----------------------------------|--------------------------------------------------|-------------------------------------------------------------------|
| Multi-AZ Terraform VPC Blueprint  | `06-infrastructure-as-code/terraform/networking/`| Modular VPC infra with NAT, private/public subnets               |
| Bash + Python Script Library      | `07-automation-scripts/`                         | Modular scripts for EC2, backups, audits                         |
| Prometheus Alerting Playbooks     | `06-infrastructure-as-code/observability/alerts/`| Sample alert rules and runbooks                                  |
| GitHub Actions Pipelines          | `07-automation-scripts/cicd/`                    | Lint, test, deploy pipelines                                     |
| EKS Introduction via Minikube     | `06-infrastructure-as-code/kubernetes/`          | Start learning K8s patterns (focus on pod YAMLs, RBAC)           |

---

## 🏗️ Phase 3: Platform-Ready Project Portfolio (Months 7–12)

| Project Name                          | Folder                                                  | Description                                                                                      |
|--------------------------------------|---------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| Resilient App Deployment on EKS      | `06-infrastructure-as-code/kubernetes/eks-deploy/`      | Deploy demo app w/ Liveness, Readiness, Resource Limits                                         |
| Centralized Logging Stack (ELK)      | `06-infrastructure-as-code/observability/elk/`          | FluentBit → Elasticsearch w/ dashboards + alerts                                                 |
| Ansible Dynamic Inventories          | `07-automation-scripts/ansible/advanced/`               | Use EC2 tagging to dynamically build inventories                                                 |
| Python boto3 Security Tools          | `07-automation-scripts/python/security/`                | S3 bucket scanner, IAM policy analyzer, security alert webhook sender                           |
| GitHub Actions Infra Deployments     | `07-automation-scripts/cicd/`                           | Dev → staging → prod deploy pattern                                                              |

---

## 🛠️ Linux Core Skills Refresher

| Topic               | Skill Area     | Location                    |
|---------------------|----------------|-----------------------------|
| SSH, Keys, Tunnels  | Access & Secure Ops | `common/linux-refreshers/ssh/` |
| Systemd, journald   | Logging & Service Mgmt | `common/linux-refreshers/systemd/` |
| ip/ss/tcpdump       | Networking Tools | `common/linux-refreshers/networking/` |
| Permissions + Sudo  | Access Control  | `common/linux-refreshers/permissions/` |
| Bash Scripting Tips | Automation Basics | `common/linux-refreshers/bash/` |

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
│   ├── logging
│   └── monitoring-stack
├── 06-infrastructure-as-code
│   ├── containers
│   ├── kubernetes
│   │   └── eks-deploy
│   ├── observability
│   │   ├── alerts
│   │   └── elk
│   ├── containerization
│   └── terraform
│       ├── networking
│       ├── compute
│       └── storage
├── 07-automation-scripts
│   ├── ansible
│   │   └── advanced
│   ├── bash
│   ├── cert-automation
│   ├── cicd
│   └── python
│       └── security
├── common
│   └── linux-refreshers
├── docs

```

## AWS Serviced Covered (By Project)
- EC2, VPC, IAM, S3, KMS, CloudWatch, CloudTrail
- EKS, Lambda (via CI/CD), GuardDuty
- Terraform, Ansible, GitHub Actions, Prometheus, Grafana, ELK
- Python + boto3, Bash scripting for CLI automation


## 📎 Related Docs

- [AWS CLI Docs](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
- [boto3 Python SDK](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Ansible AWS Guide](https://docs.ansible.com/ansible/latest/scenario_guides/guide_aws.html)
- [Prometheus Documentation](https://prometheus.io/docs/introduction/overview/)
- [Grafana Documentation](https://grafana.com/docs/grafana/latest/)
- [ELK Stack Guide](https://www.elastic.co/guide/en/elastic-stack-get-started/current/get-started-elastic-stack.html)
