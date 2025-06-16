# KMS Key Creation

This folder contains a bash script and policy file to create a KMS key for use in storage encryption.

## Files

- `create-kms-key.sh`: Bash script that creates a customer-managed KMS key.
- `kms-key-policy.json`: Custom key policy applied to the created key.

## Prerequisites

- AWS CLI configured with sufficient permissions:
  - `kms:CreateKey`
  - `kms:PutKeyPolicy`
- AWS profile/environment set up correctly.

## Usage

```bash
bash create-kms-key.sh
