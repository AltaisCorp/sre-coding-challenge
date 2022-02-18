# sre-challenge

## Table of contents

<!--ts-->

* [Table of contents](#table-of-contents)
* [Description](#description)
* [01-state](#01-state)
* [02-infra](#02-infra)
* [03-s3-notification](#03-s3-notification)

<!--te-->

## Description

The following folders are to be deployed in order via Terraform:
- 01-state
- 02-infra
- 03-s3-notification

### 01-state

Deploys the s3 buckets that will be used to store the individual state files per service and the DDB tables for locking.

### 02-infra

Deploys:

- 1 x vpc
- 1 x igw
- 1 x public subnet
- 1 x sg for ingress/egress for web
- 1 x ec2 apache web server

### 03-s3-notification

Deploys the sns topic, access policy, subscription and s3 bucket used for the upload file/object notification challenge.