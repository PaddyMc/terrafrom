# Terraform deployment

## Overview
Terraform script for deploying a service to a k8s pod on Digital Ocean

Ensure you have `kubectl` set up, and connect to your k8s cluster

Add your digital ocean token to `variables.tf`

Add your docker image repo to `variables.tf`

## Prerequisits
Install [teraform](https://www.terraform.io/)

Export the PG_URI environment variable to connect to the remote tf state
```shell
export PG_URI=postgresql://<name>:<pw>@<host>:<port>/terraform_backend?sslmode=require
```

- Deploy service on each pod
```shell
./deploy.sh
```

- Destroy service
```shell
./destroy.sh
```