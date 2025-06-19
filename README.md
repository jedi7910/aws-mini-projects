# 🚀 Cloud Infrastructure Architecture Portfolio & Roadmap (12-Month)

This portfolio supports my transition from an implementation-focused Infrastructure Architect at IBM to a cloud infrastructure architect role emphasizing design, delivery oversight, and secure, scalable architecture patterns. It documents a progression through hands-on design modules, architecture-first projects, and reference implementations with reusable automation templates.

---

## 🎯 Objectives

- Translate infrastructure and Linux expertise into scalable AWS architecture
- Design production-ready network, security, and deployment models
- Deliver modular Terraform, Ansible, and scripting templates for implementation teams
- Create clear architecture diagrams, design trade-off documentation, and reusable modules
- Govern the delivery of infrastructure, monitoring, and automation initiatives
- Demonstrate readiness for senior cloud infrastructure and platform architecture roles

---

## 📚 Phase 1: Core Infrastructure & Monitoring Architecture (Months 1–3)

| Architecture Module           | Folder                                     | Summary                                                        |
|------------------------------|--------------------------------------------|----------------------------------------------------------------|
| Prometheus + Grafana Design  | `06-infrastructure-as-code/observability/` | Design a monitoring stack with diagrams, alerts, and reuse guides |
| ELK Stack Reference Setup     | `06-infrastructure-as-code/observability/elk/` | Logging and visualization design for operational visibility     |
| Docker Fundamentals           | `06-infrastructure-as-code/containerization/` | Container lifecycle basics; reference Dockerfiles and patterns  |
| AWS SAA Certification         | —                                          | Complete AWS Solutions Architect Associate exam for core fluency |

---

## ⚙️ Phase 2: Infrastructure Design & Implementation Patterns (Months 4–6)

| Design Project                     | Folder                                           | Deliverables                                                      |
|-----------------------------------|--------------------------------------------------|-------------------------------------------------------------------|
| Terraform IaC Modules             | `06-infrastructure-as-code/terraform/`           | Modular, reusable IaC templates with input/output variables       |
| Bash & Python Automation Patterns | `07-automation-scripts/`                         | Command-line automation for AWS services with delegation in mind |
| Monitoring Alert Playbooks        | `06-infrastructure-as-code/observability/alerts/`| Alert configuration patterns for Prometheus and Grafana           |

---

## 🏗️ Phase 3: Full Cloud Infrastructure & Delivery-Ready Projects (Months 7–12)

| Project Name                          | Folder                                                  | Description                                                                                      |
|--------------------------------------|---------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| Multi-AZ VPC Reference Architecture  | `06-infrastructure-as-code/terraform/networking/`       | Design + reusable Terraform for public/private subnets, NAT, routing, and security groups       |
| EKS Cluster Deployment Framework     | `06-infrastructure-as-code/kubernetes/eks-deploy/`      | Blueprint for managed Kubernetes workloads with automation and diagram assets                   |
| Centralized Logging + Alerting       | `06-infrastructure-as-code/observability/elk/`          | Design for ingesting multi-account logs to a central ELK stack with alert rules                 |
| CI/CD Delivery Pipeline Design       | `07-automation-scripts/cicd/`                           | Lightweight CI/CD pipelines (GitHub Actions or Jenkins) with reusable configurations            |
| Python boto3 Automation Modules      | `07-automation-scripts/python/`                         | Reusable cloud automation modules with error handling and logging standards                     |
| Advanced Ansible Architecture        | `07-automation-scripts/ansible/advanced/`               | Custom module and plugin development for cloud infra tasks with dynamic inventories and Vault   |

---

## 🧠 Advanced Ansible & Plugin Architecture

Focuses on creating reusable automation building blocks for teams to consume, including:

- Custom Ansible modules for non-standard resource automation
- Advanced Vault-secured playbooks for secret management
- Dynamic inventories for AWS
- Plugin architecture for callback, lookup, and connection extensions
- Molecule testing integration via GitHub Actions

**Deliverables:**
- 2+ custom modules with associated Molecule tests
- Dynamic inventory for AWS/Cloud usage
- GitHub CI integration for Ansible validation and linting

---

## 🛡️ Phase 4: Architecture Finalization & Security Design (Months 9–12)

| Architecture Exercise             | Folder                                     | Outcome                                                                                           |
|----------------------------------|--------------------------------------------|---------------------------------------------------------------------------------------------------|
| Multi-Account AWS Org Design     | `08-design-exercises/multi-account-org/`   | Document AWS org account structure, SCPs, shared services, and governance models                 |
| Disaster Recovery Architecture   | `08-design-exercises/dr-scenario/`         | Define RTO/RPO trade-offs and reference DR architecture with regional failover patterns          |
| Cost Optimization Strategy       | `08-design-exercises/cost-optimization/`   | Cost-performance trade-off docs; selection rationale for instance types, storage, and bandwidth  |
| Final Architecture Polish        | All project folders                        | Add final `README.md`, `architecture.png`, and automation entrypoints                            |

---

## 🔐 AWS Security Specialty Prep & Security Architecture Projects

| Security Project                     | Folder                                         | Description                                                                                       |
|-------------------------------------|------------------------------------------------|---------------------------------------------------------------------------------------------------|
| S3 Bucket Security Audit Script     | `07-automation-scripts/python/security/`       | Automate audit of bucket encryption, policies, and access levels                                  |
| GuardDuty & CloudWatch Alarms       | `06-infrastructure-as-code/observability/`     | Enable threat detection and alerting via CloudWatch/SNS                                           |
| SCP + IAM Policy Governance         | `01-iam/organizations/`                        | Apply security guardrails and permission boundaries across org accounts                           |
| KMS Key Rotation & Encryption Demo  | `04-storage/s3/kms/`                           | CMK rotation workflows and encrypted object upload/download scripting                            |
| Centralized CloudTrail Architecture | `05-security/logging/cloudtrail/`              | Cross-account logging to secure, encrypted S3 with lifecycle policies                             |
| AWS Security Specialty Study Plan   | —                                              | Focus on KMS, IAM, GuardDuty, SCPs, hybrid architectures, and audit logging                       |

---

## 📂 Repository Structure

```plaintext
.
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
│   ├── bash
│   ├── cert-automation
│   ├── cicd
│   └── python
│       └── security
├── 08-design-exercises
│   ├── multi-account-org
│   ├── dr-scenario
│   └── cost-optimization
├── common
└── docs
```

## 📎 Related Docs

- [AWS IAM Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)
- [AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
- [AWS Solutions Architect Associate Exam Guide](https://aws.amazon.com/certification/certified-solutions-architect-associate/)
- [Prometheus Documentation](https://prometheus.io/docs/introduction/overview/)
- [Grafana Documentation](https://grafana.com/docs/grafana/latest/)
- [ELK Stack Guide](https://www.elastic.co/guide/en/elastic-stack-get-started/current/get-started-elastic-stack.html)
- [AWS Security Documentation](https://docs.aws.amazon.com/security/)
- [AWS KMS Documentation](https://docs.aws.amazon.com/kms/latest/developerguide/overview.html)