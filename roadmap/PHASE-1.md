# Phase 1 — AWS Foundations + Infra Engineer Portfolio Build

### Timeline: ~3 months

---

## ✅ Goal:

- Build a solid portfolio of *Infrastructure-as-Code ready*, highly-automatable AWS foundational services.
- Build core skillsets in IAM, S3, EC2, Networking, and simple scripting.
- Prep work for Phase 2 monitoring, automation, and containerization.

---

## 🔧 Projects Breakdown

### 1️⃣ IAM

- [x] ✅ Assume-Role Console Exercise
- [x] ✅ SCP Restrict-S3 Lab

### 2️⃣ Storage (S3 + KMS)

- [x] ✅ S3 Static Website (public access + policies)
- [x] ✅ KMS Customer Managed Key creation (your existing kms project)
- [ ] 🔄 Integrate S3 Static Website project with KMS encryption (current work)

### 3️⃣ Networking

- [ ] VPC creation via CLI:
  - Create VPC, Subnet, IGW, Route Table, and simple security groups
- [ ] Document & diagram the VPC setup

### 4️⃣ Compute (EC2)

- [ ] Launch EC2 instance via CLI
- [ ] Assign appropriate IAM role
- [ ] Attach instance profile
- [ ] Test connectivity and SSH

### 5️⃣ Infrastructure as Code

- [ ] Begin small terraform version of 1 full mini-project (IAM + S3 combo)
- [ ] Store IaC scripts under `06-infrastructure-as-code/phase-1`

### 6️⃣ Automation Scripts

- [ ] Begin simple bash automation for common resource creation (S3, VPC, EC2)

---

## 🔑 Deliverables

- Each project has:
  - Modular bash scripts (or small Python if preferred later)
  - README.md with usage
  - Permissions required documented
  - Any key architecture diagrams (put in `/docs/`)

---

## 🔬 Bonus Stretch Items (if time allows)

- Implement basic tagging standards for all AWS resources
- Create simple delete/cleanup scripts for your resources

---

## ✅ Key Notes

- You may still use AWS Console *initially* for testing, but everything should end in CLI/Bash automation.
- Python scripting will be very light early — Bash is perfectly fine for now.
- Infrastructure as Code will begin late Phase 1 with very simple Terraform builds.

---

## 🚀 After Phase 1:

- We will move to **Observability & Monitoring stack (Phase 2)**.
- CloudWatch, ELB, Prometheus, Grafana, ELK stack introduced.
