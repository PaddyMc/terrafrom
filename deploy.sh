#!/bin/bash

terraform init -backend-config="conn_str=$PG_URI"
terraform apply -auto-approve
