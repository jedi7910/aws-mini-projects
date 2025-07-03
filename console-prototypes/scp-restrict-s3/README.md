# SCP Demo: S3 Deny Policy Validation

## Overview

This project demonstrates how to use AWS Service Control Policies (SCPs) within an AWS Organization to restrict access to S3 services for an Organizational Unit (OU). 

Specifically, it shows how attaching an SCP that denies all S3 actions effectively blocks users in the OU from accessing S3 buckets or listing them.

---

## SCPs Used

### 1. AllowAllExceptS3 (Custom SCP)

- **Description:** Denies all S3 actions while allowing all other AWS services.  
- **Policy JSON:**

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}

```

### Environment Details
- Management Account: KH-TRAINING-AWS-GEN
- Organizational Units (OUs): Root, Prod, Dev
- Attached SCPs:
    - FullAWSAccess: Root, Prod, Dev
    - AllowAllExceptS3: Prod (demo/testing only)


### Validation Steps
- Attach the AllowAllExceptS3 SCP to the Prod OU via the AWS Organizations console.
- Attempt to access any Amazon S3 resource in an account under the Prod OU (e.g., list buckets, open bucket in console).
- Confirm access is denied with an error indicating insufficient permissions due to SCP restrictions.
- Use the AWS Organizations Policy Simulator tool to simulate and verify the SCP's effect on target accounts.
- Remove the AllowAllExceptS3 SCP from the Prod OU after validation to restore access.

## Policies Used

- **FullAWSAccess** — AWS Managed Policy  
  Reference: [AWS Policy: FullAWSAccess](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_example.html#orgs_manage_policies_fullawsaccess)

- **AllowAllExceptS3** — Custom SCP (stored in `scps/allow-all-except-s3.json`)
  - Denies all `s3:*` actions across all resources.

## Screenshots

- [SCP Policy Attached to PROD OU](screenshots/AllowAllExceptS3-Prod.png)
- [S3 Deny Validation Screenshot](screenshots/ProdErrorS3.png)
- [S3 Allowed Validation Screenshot](screenshots/DevAllowedS3.png)


### Notes
- SCPs affect all IAM users and roles in affected accounts regardless of their individual permissions.
- Be careful when attaching restrictive SCPs; they can block critical access and require management account intervention to fix.
- This demo focused on blocking S3 access, but SCPs can be used to restrict any AWS service or region.

### Next Steps
- Add a SCP to restrict usage by AWS Region (e.g., allow only us-east-1 and us-west-2).
- Include region restriction SCP in this project folder once completed.

### Directory Structure Suggestion

```bash

01-iam/
└── org-scp-demo/
    ├── README.md
    └── screenshots/

```

### References
For more info, see the [AWS IAM AssumeRole documentation][iam-doc].

Also, check the [AWS Organizations Service Control Policies (SCP)][org-doc].

...

[iam-doc]: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role.html
[org-doc]: https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html


