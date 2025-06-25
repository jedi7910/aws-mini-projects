# IAM AssumeRole CLI Mini-Project

This mini-project demonstrates how to set up cross-account AWS IAM AssumeRole access using the AWS CLI with least privilege principles. It automates role creation, trust policies, and permission policies across multiple AWS accounts, then uses a reusable script to assume roles from CLI profiles.

---

## 🎯 Project Goal

Enable secure and controlled AssumeRole workflows among three AWS accounts — Gen, Prod, and Dev — for IAM users:

- `iamadmin-gen-cli` (in Gen account) can assume roles in Prod and Dev  
- `iamadmin-prod-cli` (in Prod account) can assume role in Dev only  

This supports secure cross-account access automation and showcases AWS CLI and IAM best practices.

---

## ⚠️ Prerequisites

- AWS CLI v2 installed and configured  
- `jq` installed for JSON parsing (e.g., `sudo apt install jq`)  
- Existing IAM users:
  - `iamadmin-gen-cli` in Gen account  
  - `iamadmin-prod-cli` in Prod account  
  - *No user needed in Dev; assume role is done via root or other privileged method*  
- AWS CLI profiles configured for these users (`iamadmin-gen` and `iamadmin-prod`)  
- `config.sh` sourced with correct account IDs, role names, and profile variables set  

---

## 🛠 Setup Steps (Manual CLI Overview)

1. ### Source config variables  
```bash
   source config.sh
```

2. ### Create roles with trust policies in target account
- Gen → Prod role (`GenAssumeAccess`) with trust allowing `iamadmin-gen-cli` user
- Gen → Dev role (`GenAssumeAccess`) with trust allowing `iamadmin-gen-cli` user
- Prod → Dev role (`ProdAssumeAccess`) with trust allowing `iamadmin-prod-cli` user

3. ### Attach permission policies to roles
- For initial testing, attach `AdministratorAccess` (or custom least privilege policies later)

4. ### Test role assumption using the `assume-role.sh` script
```bash
./assume-role.sh $PROD_ACCOUNT_ID GenAssumeAccess iamadmin-gen-cli
```
Run this command to assume a role and load credentials into your current shell:

```bash
source ./scripts/assume-role-sh <TARGET_ACCOUNT_ID> <ROLE_NAME> <SOURCE_PROFILE>
```

## 📂 Repository Structure
```bash
.
├── README.md
├── config.sh                          # Variables for accounts, roles, profiles
├── create-role-dev.sh                 # CLI commands to create role in Dev account
├── create-role-prod.sh                # CLI commands to create role in Prod account
├── permission-policies/
│   ├── admin-access-policy.json      # Admin policy (or replace with least privilege)
│   └── limited-ec2-s3.json            # Example limited permissions policy
├── scripts/
│   ├── assume-role.sh                 # Parameterized assume-role script with comments
│   ├── assume-role-from-gen.sh       # Optional older script (can be removed)
│   └── assume-role-from-prod.sh      # Optional older script (can be removed)
└── trust-policies/
    ├── trust-policy-gen-to-dev.template.json
    ├── trust-policy-gen-to-prod.template.json
    └── trust-policy-prod-to-dev.template.json
```

## 🚀 How to Use

### 1. Source your config
```bash
source config.sh
```

### 2. Create roles in Prod and Dev acounts (or whatever you call them):
- Run `create-role-prod.sh` and `create-role-dev.sh` to create roles with correct trust policies and attach permission policies.

### 3. Assume role and export credentials:
Use the reusable script to assume role from any configured profile:
```bash
./scripts/assume-role.sh <account_id> <role_name> <profile>
```
Example:
```bash
./scripts/assume-role.sh $PROD_ACCOUNT_ID GenAssumeAccess iamadmin-gen-cli
```

### 4. Validate assumed role permissions:
Run commands like:
```bash
aws s3 ls --profile assumed-role
```
(Assuming you export the environment variables as per script instructions)

## 💡 Best Practices & Notes
- Start with `AdministratorAccess` only for quick testing; replace with least privilege policies after validation.
- Always verify trust policies reference the correct IAM user ARN.
- Clean up roles and policies when done to avoid security risks.
- For automation and reproducibility, keep all AWS CLI commands in create-role-*.sh scripts with placeholders.
- Use AWS profiles to manage multiple users/accounts cleanly.

## 🧹 Cleanup
To remove roles, run corresponding `aws iam delete-role` and detach policies commands manually or script as needed.

## 📎 References
[AWS IAM Roles and Trust Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html)
[AWS CLI Assume Role](https://docs.aws.amazon.com/cli/latest/reference/sts/assume-role.html)
[jq JSON Processor](https://stedolan.github.io/jq/)
[Best Practices for IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)