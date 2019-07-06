# Terraform deployment

## Overview
Terraform script for deploying a service to a k8s pod on Digital Ocean

Ensure you have `kubectl` set up, and connect to your k8s cluster

Add your digital ocean token to `variables.tf`

Add your docker image repo to `variables.tf`

## Prerequisits
Install [teraform](https://www.terraform.io/)

- Deploy service on each pod
```shell
./deploy.sh
```

- Destroy service
```shell
./destroy.sh
```