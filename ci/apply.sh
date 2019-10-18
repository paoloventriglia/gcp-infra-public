#!/bin/sh
set -ex
for dir in `ls ../resources`; do
cd "../resources/$dir"
if [ -f 'plan' ]; then
  echo "Applying ${dir} plan"
  terraform apply $dir.plan
else
  echo "${dir} plan not found"
  exit 1
fi
 cd "../../ci"
done