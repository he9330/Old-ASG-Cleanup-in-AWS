#!/usr/bin/env bash
set -e

# Read input JSON from Terraform
read -r input
expiry_days=$(echo "$input" | jq -r '.expiry_days')

cutoff_date=$(date -d "-${expiry_days} days" +%Y-%m-%d)
echo "Checking for ASGs tagged before ${cutoff_date}" >&2

old_asgs=$(aws autoscaling describe-auto-scaling-groups \
  --query "AutoScalingGroups[?Tags[?Key=='MarkedForDelete' && Value<='${cutoff_date}']].AutoScalingGroupName" \
  --output text)

if [[ -z "$old_asgs" ]]; then
  jq -n '{"old_asgs":[]}'
else
  echo "$old_asgs" | jq -R -s -c 'split("\t") | {"old_asgs": .}'
fi
