# sre-challenge

## Table of contents

<!--ts-->

* [Description](#description)
* [Task-01-02_s3_notification](#Task-01-02_s3_notification)
* [Task-03_terratest](#Task-03_terratest)
* [Task-04](#Task-04)
* [Task-05_diagram](#Task-05_diagram)
* [Task-06_k8s](#Task-06_k8s)
<!--te-->

## Description

The following folders are to be deployed in order via Terraform:
- Task-04
- Task-01-02_s3_notification

### Task-01-02_s3_notification

1) Upload a text file to a AWS S3 bucket
2) On upload, trigger some type of alert (SNS, Email)

- Deploys the sns topic, access policy, subscription and s3 bucket used for the upload file/object notification challenge.

### Task-03_terratest

3) Write at least one unit test using a framework and/or linters such as Terratest

- Test the statefile deployment and s3 notification resources by doing a Terraform Init, Apply & Destroy

Instructions to test:  
```cd test ; go test -v```

### Task-04

4) Create the VPC, IGW, Route Table, Subnet, Security Group and EC2 instance running Apache

**Task-04_1_state**: _(deploy first)_
- Deploys the s3 buckets that will be used to store the individual state files per service and the DDB tables for locking.

**Task-04_2_infra**: _(deploy second)_
- Create the VPC, IGW, Route Table, Subnet, Security Group and EC2 instance running Apache

### Task-05_diagram


### Task-06_k8s

This repo will deploy ArgoCD (GitOps CD Tool) which will download and deploy a Guestbook app in Kubernetes
