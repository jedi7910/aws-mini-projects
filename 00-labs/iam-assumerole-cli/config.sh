#!/bin/bash

# AWS Account IDs
export GEN_ACCOUNT_ID="724607192048"
export PROD_ACCOUNT_ID="270325282713"
export DEV_ACCOUNT_ID="622158567941"

# IAM User Names
export IAMUSER_GEN="iamadmin-gen-cli"
export IAMUSER_PROD="iamadmin-prod-cli"
export IAMUSER_DEV="iamadmin-dev-cli"

# CLI Profiles for IAM Users
export GEN_PROFILE="iamadmin-gen"
export PROD_PROFILE="iamadmin-prod"
export DEV_PROFILE="iamadmin-dev"

# Role Names to create in target accounts
export ROLE_NAME_GEN_TO_PROD="GenAssumeAccess"
export ROLE_NAME_GEN_TO_DEV="GenAssumeAccess"
export ROLE_NAME_PROD_TO_DEV="ProdAssumeAccess"

# Trust policy JSON folder path
export TRUST_POLICY_DIR="trust-policies"

# Permission policy JSON folder path
export PERMISSION_POLICY_DIR="permission-policies"
