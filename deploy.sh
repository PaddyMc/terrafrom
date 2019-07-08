#!/bin/bash
terraform init -backend-config="conn_str=${PG_URI}"
terraform workspace new go-apis
terraform workspace select go-apis
terraform apply -auto-approve
