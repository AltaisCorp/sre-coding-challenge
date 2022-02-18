
   
terraform {
  required_version = "~> v1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.1"
    }
  }
  backend "s3" {
    bucket = "srec-s3-notification-terraform-state"
    key    = "terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "srec-s3-notification-terraform-state-lock-ddb"
  }
}

provider "aws" {
  region = var.region
}