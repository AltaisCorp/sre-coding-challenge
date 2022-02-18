

terraform {
  required_version = "~> v1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.1"
    }
  }
  backend "s3" {
    bucket         = "sre-ds-atlaiscorp-vpc-tf-state"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "sre-ds-atlaiscorp-tf-state-lock-ddb-vpc"
  }
}

provider "aws" {
  region = var.region
}
