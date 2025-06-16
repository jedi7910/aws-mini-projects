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
| Multi-AZ VPC Design + Terraform | `06-infrastructure-as-code/terraform/networking/`           | Multi-AZ VPC with public/private subnets via Terraform                                        |
| EKS Cluster + App Deployment    | `06-infrastructure-as-code/kubernetes/eks-deploy/`           | Setup EKS cluster and deploy app with monitoring                                             |
| Centralized Logging & Alerting  | `06-infrastructure-as-code/observability/elk/`               | Integrate ELK stack with CloudWatch Logs and alerts                                          |
| CI/CD Pipeline Basics           | `07-automation-scripts/cicd/`                                | Simple CI/CD pipelines with GitHub Actions or Jenkins                                        |
| Python Automation Enhancements  | `07-automation-scripts/python/`                              | Automate cloud resources with boto3                                                         |
| Advanced Ansible & Custom Modules | `07-automation-scripts/ansible/advanced/`                    | Develop custom Ansible modules and plugins; advanced error handling, dynamic inventories, and Vault usage |

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
