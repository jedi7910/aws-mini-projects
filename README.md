# 🚀 AWS Cloud Infrastructure & Engineering Roadmap (12-Month)

*This roadmap supports my transition from Infrastructure Architect at IBM to a backend-focused Cloud Infrastructure Engineer, Platform Engineer, or Cloud Engineer role — focusing on operations, monitoring, automation, and containerization without customer-facing or pre-sales duties.*

---

## 🎯 Goals

- Leverage existing infrastructure & Linux expertise  
- Gain solid experience with cloud-native monitoring & logging tools (Prometheus, Grafana, ELK)  
- Master containerization basics (Docker, Kubernetes)  
- Develop scripting and automation skills in Bash and Python  
- Build a portfolio targeting backend infrastructure/cloud engineering roles paying $150K+

---

## 📚 Phase 1: Core Cloud Infrastructure + Monitoring Fundamentals (Months 1–3)

| Mini Project               | Folder                                     | Description                                         |
|---------------------------|--------------------------------------------|-----------------------------------------------------|
| Prometheus + Grafana Setup | `06-infrastructure-as-code/observability/` | Deploy Prometheus & Grafana on local VMs or cloud  |
| ELK Stack Basic Setup      | `06-infrastructure-as-code/observability/elk/` | Set up Elasticsearch, Logstash, Kibana for logging |
| Basic Docker & Containers  | `06-infrastructure-as-code/containerization/` | Learn Dockerfile basics, container lifecycle        |
| AWS SAA Completion         | —                                          | Complete AWS Solutions Architect Associate exam     |

---

## 🧰 Phase 2: Intermediate Automation + Container Orchestration (Months 4–6)

| Mini Project               | Folder                                         | Description                                          |
|---------------------------|------------------------------------------------|------------------------------------------------------|
| Kubernetes Intro          | `06-infrastructure-as-code/kubernetes/`         | Deploy simple K8s cluster using Minikube or EKS      |
| Infrastructure as Code    | `06-infrastructure-as-code/terraform/`           | Terraform basics for AWS resources                    |
| Bash & Python Scripting   | `07-automation-scripts/`                          | Scripts to automate EC2, S3, and other AWS tasks     |
| Monitoring Alerts        | `06-infrastructure-as-code/observability/alerts/` | Configure Prometheus/Grafana alert rules              |

---

## 🔧 Phase 3: Full Cloud Infrastructure Projects + Advanced Automation (Months 7–12)

| Project                      | Folder                                                      | Description                                                                                   |
|------------------------------|-------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Multi-AZ VPC Design + Terraform | `06-infrastructure-as-code/terraform/networking/`           | Multi-AZ VPC with public/private subnets via Terraform. Include architecture diagram and README with tradeoffs. |
| EKS Cluster + App Deployment    | `06-infrastructure-as-code/kubernetes/eks-deploy/`           | Setup EKS cluster and deploy app with monitoring. Include deployment scripts and architecture docs. |
| Centralized Logging & Alerting  | `06-infrastructure-as-code/observability/elk/`               | Integrate ELK stack with CloudWatch Logs and alerts. Document integration pattern and alert types. |
| CI/CD Pipeline Basics           | `07-automation-scripts/cicd/`                                | Simple CI/CD pipelines with GitHub Actions or Jenkins. Describe stages and reusable config. |
| Python Automation Enhancements  | `07-automation-scripts/python/`                              | Automate cloud resources with boto3. Build reusable modules and add error handling.          |
| Advanced Ansible & Custom Modules | `07-automation-scripts/ansible/advanced/`                    | Develop custom Ansible modules and plugins; advanced error handling, dynamic inventories, and Vault usage. |

---

### Advanced Ansible & Custom Modules (Detailed)

This project focuses on deepening your Ansible skills by developing custom modules and plugins, improving error handling, working with dynamic inventories, and mastering Ansible Vault.

- Improve error handling and debugging techniques in playbooks (using `assert`, `failed_when`, retries).
- Learn Ansible module development framework (Python-based).
- Build custom modules to manage resources not covered by existing modules (e.g., cloud APIs, network devices).
- Create and integrate custom plugins (callback, lookup, connection).
- Work with dynamic inventories for cloud providers like AWS and Azure.
- Use Ansible Vault advanced features for managing secrets securely.
- Write test playbooks incorporating custom modules/plugins.
- Document and version control your modules for reuse.

**Deliverables:**
- At least two custom modules with test playbooks.
- A dynamic inventory script configured for a cloud provider.
- Vault-secured playbooks for sensitive data.

---

---

## 🛡️ Phase 4: Architect Polish, Design Artifacts & AWS Security Specialty Prep (Months 9–12)

| Task                              | Folder                                       | Description                                                                                       |
|----------------------------------|----------------------------------------------|-------------------------------------------------------------------------------------------------|
| Retrofit Key Projects            | Per-project folders                          | Add architecture diagrams, Terraform refactors, and tradeoff docs                                |
| Multi-Account AWS Org Design     | `08-design-exercises/multi-account-org/`     | Write a doc explaining account separation, SCPs, centralized logging setup                       |
| Disaster Recovery Design         | `08-design-exercises/dr-scenario/`           | Create a DR scenario with RTO/RPO planning and infrastructure recommendations                     |
| Cost Optimization Case Study     | `08-design-exercises/cost-optimization/`     | Compare and justify infra decisions for performance vs. cost                                     |
| Final Project Portfolio Polish   | All major projects (EKS, VPC, CI/CD)         | Add finished README.md, `architecture.png`, and deployment automation                            |

| Security Specialty Exam Prep & Projects | Folder                                      | Description                                                                                       |
|-----------------------------------------|---------------------------------------------|-------------------------------------------------------------------------------------------------|
| AWS Security Specialty Exam Prep        | —                                           | Use learn.cantrill.io course focusing on KMS, IAM, CloudTrail, GuardDuty, SCPs, and audit logging|
| S3 Bucket Security Audit Automation     | `07-automation-scripts/python/security/`    | Python script to audit S3 buckets for encryption, public access, bucket policies                  |
| GuardDuty + CloudWatch Alarms Setup     | `06-infrastructure-as-code/observability/`  | Enable GuardDuty, configure alerts with CloudWatch & SNS for security findings                    |
| SCP & IAM Policy Governance             | `01-iam/organizations/`                     | Apply Service Control Policies at org level to enforce security guardrails                        |
| KMS Key Rotation + Encryption Demo      | `04-storage/s3/kms/`                        | Showcase manual and automatic CMK key rotation and encrypted S3 upload/download script           |
| CloudTrail Centralized Logging          | `05-security/logging/cloudtrail/`           | Enable org-wide CloudTrail with centralized S3 log storage and encryption                         |

---

## 📂 Repo Structure Summary

```plain
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
├── 08-design-exercises
│   ├── multi-account-org
│   ├── dr-scenario
│   └── cost-optimization
├── common
└── docs
```

## Scripts

All automation is handled via modular scripts located in the `scripts/` directory for each module. These scripts can be run individually or orchestrated through the main controller script to manage the S3 static site lifecycle.

For clarity, we refer to them simply as “scripts” throughout this project, though they are implemented as Bash shell scripts.


### 📝 Study Focus for AWS Security Specialty

- IAM permission boundaries, SCPs, and federation  
- KMS, envelope encryption, key rotation, cross-account access  
- Logging: CloudTrail, Config, GuardDuty, Security Hub  
- Incident response and threat detection architecture  
- Secure hybrid and multi-account architectures  

## 📎 Related Docs

- [AWS IAM Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)
- [AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
- [AWS Solutions Architect Associate Exam Guide](https://aws.amazon.com/certification/certified-solutions-architect-associate/)
- [Prometheus Documentation](https://prometheus.io/docs/introduction/overview/)
- [Grafana Documentation](https://grafana.com/docs/grafana/latest/)
- [ELK Stack Guide](https://www.elastic.co/guide/en/elastic-stack-get-started/current/get-started-elastic-stack.html)
