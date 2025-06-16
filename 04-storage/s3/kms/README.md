# KMS Key Creation

This folder contains a bash script and policy files to create a customer-managed AWS KMS key for use in storage encryption.

## Files

- `create-kms-key.sh`: Bash script that creates a KMS key and applies a custom key policy.
- `kms-key-policy.json`: JSON file defining the key policy attached to the KMS key.
- `test-policy.json`: Example key policy file for testing.

## Prerequisites

- AWS CLI installed and configured with a profile that has permissions:
  - `kms:CreateKey`
  - `kms:PutKeyPolicy`
- AWS CLI profile or environment variables properly set.

## Usage

Run the script with the required parameters:

```bash
bash create-kms-key.sh --alias alias/my-storage-key --policy-file kms-key-policy.json
```

Optional Parameters:
- --username IAM username used in the key policy (default: iamadmin)
- --description Description for the KMS key
- --region AWS region (default: us-east-1)

Example with all parameters:
```bash
bash create-kms-key.sh --alias alias/my-storage-key --policy-file kms-key-policy.json [options]
```


Options:
| Argument        | Description                                               | Required | Default     |
| --------------- | --------------------------------------------------------- | -------- | ----------- |
| `--alias`       | Alias name for the KMS key (e.g., `alias/my-storage-key`) | Yes      | -           |
| `--policy-file` | Path to the JSON file containing the key policy           | Yes      | -           |
| `--username`    | IAM username referenced in the key policy                 | No       | `iamadmin`  |
| `--description` | Description text for the KMS key                          | No       | (none)      |
| `--region`      | AWS region for the key creation                           | No       | `us-east-1` |

## Example Usage
```bash
bash create-kms-key.sh --alias alias/my-storage-key --policy-file policies/test-policy.json --username iamadmin --description "KMS key for S3 encryption" --region us-east-1
```

## Requirements
- AWS CLI installed and configured with an AWS profile having KMS create key permissions.
- JSON key policy template file with placeholders {{ACCOUNT_ID}} and {{IAM_USERNAME}} for dynamic substitution.
- IAM user or role must have permissions to create keys, aliases, and attach policies.

## How it Works
1. The script reads arguments and validates required parameters.
2. It sets the AWS region from parameter or environment, defaulting to us-east-1.
3. It fetches the current AWS Account ID using aws sts get-caller-identity.
4. It replaces the placeholders {{ACCOUNT_ID}} and {{IAM_USERNAME}} in the key policy JSON file.
5. It creates the KMS key with the customized key policy.
6. It creates an alias pointing to the new KMS key.
7. It outputs the new key ID and alias for confirmation.

## Cleanup
Temporary files created for policy replacement are cleaned up automatically.

## Troubleshooting
- Ensure your AWS CLI profile has necessary KMS permissions.
- Verify the JSON policy template is valid and contains the required placeholders.
- Check AWS region settings if you encounter region-related errors.

## Contact/Support
For questions or issues, please open an issue in this repository or contact the maintainer.