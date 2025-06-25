#!/bin/bash

source config.sh

# Render trust policy to /tmp
envsubst < trust-policies/trust-policy-gen-to-prod.template.json > /tmp/trust-policy-gen-to-prod.json
