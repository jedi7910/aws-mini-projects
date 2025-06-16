# 🚀 Cloud Infrastructure Architect / Platform Engineer Roadmap (12-Month)

This roadmap supports my transition from Infrastructure Architect at IBM to a backend-focused **Cloud Infrastructure Engineer, Platform Engineer, or Cloud Engineer** role — targeting cloud infrastructure design, automation, containerization, and observability using AWS and related technologies.

---

## 🎯 Goals

- Leverage existing infrastructure & Linux expertise  
- Gain solid experience with cloud-native monitoring & logging tools (Prometheus, Grafana, ELK)  
- Master containerization and orchestration basics (Docker, Kubernetes, OpenShift)  
- Develop scripting and automation skills in Bash and Python (starting with basics)  
- Build a portfolio targeting backend infrastructure/cloud engineering roles paying $150K+  
- Avoid customer-facing or heavy pre-sales roles, focus on technical backend engineering  

---

## 📚 Phase 1: Core Cloud Infrastructure + Monitoring Fundamentals (Months 1–3)

| Mini Project               | Folder                          | Description                                                        |
|---------------------------|--------------------------------|--------------------------------------------------------------------|
| Prometheus + Grafana Setup | `05-security/monitoring-stack/` | Deploy Prometheus & Grafana on local VMs or cloud for basic metrics collection |
| ELK Stack Basic Setup      | `05-security/logging/elk/`       | Set up Elasticsearch, Logstash, Kibana for centralized logging    |
| Basic Docker & Containers  | `09-containerization/`           | Learn Dockerfile basics, container lifecycle, build and run containers |
| AWS Solutions Architect Associate (SAA) Completion | — | Complete AWS SAA certification exam |

---

## 🧰 Phase 2: Intermediate Automation + Container Orchestration & Observability (Months 4–6)

| Mini Project                 | Folder                                | Description                                               |
|-----------------------------|-------------------------------------|-----------------------------------------------------------|
| Kubernetes Intro             | `06-infrastructure-as-code/kubernetes/` | Deploy simple Kubernetes cluster with Minikube or EKS    |
| Infrastructure as Code       | `06-infrastructure-as-code/terraform/`  | Build AWS resources using Terraform basics               |
| Bash & Python Scripting      | `07-automation-scripts/`             | Automate common cloud tasks and workflows                 |
| Monitoring Alerts            | `05-security/monitoring-stack/alerts/` | Configure alerting rules in Prometheus and Grafana       |
| Observability Platform Setup | `08-observability/`                  | Deploy and configure an observability stack (Prometheus + Grafana + ELK + tracing tools) |

---

## 🔧 Phase 3: Full Cloud Infrastructure Projects + Advanced Automation (Months 7–12)

| Project                      | Folder                                | Description                                                    |
|------------------------------|-------------------------------------|----------------------------------------------------------------|
| Multi-AZ VPC Design + Terraform | `02-networking/terraform/`          | Build a multi-AZ VPC with public/private subnets via Terraform |
| EKS Cluster + App Deployment  | `06-infrastructure-as-code/kubernetes/eks-deploy/` | Set up EKS cluster and deploy sample app with monitoring       |
| Centralized Logging & Alerting| `05-security/logging/elk/`          | Integrate ELK stack with AWS CloudWatch Logs and alerts        |
| CI/CD Pipeline Basics         | `07-automation-scripts/cicd/`       | Create simple CI/CD pipelines with GitHub Actions or Jenkins   |
| Python Automation Enhancements| `07-automation-scripts/python/`     | Automate cloud resource management using boto3 Python library  |
| Containerization Best Practices| `09-containerization/`              | Build optimized Docker images, implement multi-stage builds, and container security best practices |

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
├── 08-observability
├── 09-containerization
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
