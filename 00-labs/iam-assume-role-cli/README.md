# IAM Assume Role CLI Mini Project

## Overview
Brief description of the project’s goal — setting up cross-account IAM roles with CLI scripting to demonstrate AssumeRole usage.

## Prerequisites
- AWS CLI installed and configured
- Access to AWS accounts: GEN, DEV, PROD
- IAM user with necessary permissions to create users, roles, and policies
- Account IDs for GEN, DEV, PROD accounts

## Project Structure
```plaintext
iam-assume-role-cli/
├── README.md
├── config.sh          # Configuration variables (account IDs, role names, etc.)
├── policies/          # JSON policy documents
│   ├── inline-admin-policy.json
│   ├── trust-policy-dev.json
│   └── trust-policy-prod.json
├── scripts/           # Shell scripts for automation
│   ├── create-iam-user.sh
│   ├── create-cross-account-role.sh
│   ├── attach-policy.sh
│   └── assume-role.sh
└── docs/              # Optional detailed documentation
```

## Step by Step Instructions
### 1. Create IAM User in GEN Account
- Purpose and commands/scripts used

### 2. Create Cross-Account Roles in DEV and PROD Accounts
- Trust policies explanation
- Commands/scripts used to create roles

### 3. Attach Permission Policies to Roles
- Permissions granted
- Commands/scripts used

### 4. Configure User Policy for AssumeRole
- Policy allowing sts:AssumeRole
- Commands/scripts used

### 5. Testing AssumeRole from CLI
- How to use aws sts assume-role
- Expected output and session setup

## Usage
Instructions on how to run scripts or CLI commands in order


## Notes
- Security considerations
- Least privilege principles followed
- Troubleshooting tips