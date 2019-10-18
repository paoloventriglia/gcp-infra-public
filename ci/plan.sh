#!/bin/sh
set -ex
for dir in `ls ../resources`; do
  cd "../resources/$dir"
  terraform plan out=$dir.plan -var-file=tfvars/terraform.tfvars
  cd "../../ci"
done