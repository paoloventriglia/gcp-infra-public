#!/bin/sh
set -ex
for dir in `ls ../resources`; do
if [ ! -d "../resources/$dir/.terraform" ]; then
  cd "../resources/$dir"
  mkdir .terraform && echo $dir > .terraform/environment
  terraform init -input=false
  terraform workspace select $dir
  cd "../../ci"
else
  echo "Directory exists, nothing to do"
fi
done
