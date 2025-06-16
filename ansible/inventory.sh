#!/bin/bash

cd ../terraform
instance_ip=$(terraform output -raw instance_public_ip)

cat <<EOF
{
  "web": {
    "hosts": ["$instance_ip"]
  }
}
EOF
