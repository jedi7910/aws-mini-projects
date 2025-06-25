#!/bin/bash
source config.sh

# Render both trust policies (GEN and PROD can assume into DEV)
envsubst < trust-policies/trust-policy-gen-to-dev.template.json > /tmp/trust-policy-gen-to-dev.json
envsubst < trust-policies/trust-policy-prod-to-dev.template.json > /tmp/trust-policy-prod-to-dev.json
