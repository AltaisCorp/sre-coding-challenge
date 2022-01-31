terraform {
  required_version = "~> 1.0"  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"       
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "altair-oloye" { 
  bucket = "altairoloye123"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.altair-oloye.id  
  key    = "test.txt"
  source = "test.txt"
  etag = filemd5("test.txt")
}