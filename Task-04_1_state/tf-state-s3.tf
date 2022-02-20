module "s3_tfstate_bucket_vpc" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.9.0"

  acl                     = "private"
  block_public_acls       = true
  block_public_policy     = true
  bucket                  = "${local.name}-vpc-tf-state"
  ignore_public_acls      = true
  restrict_public_buckets = true
  tags                    = local.common_tags
  versioning = {
    enabled = true
  }
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}


module "s3_tfstate_bucket_s3_notification" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.9.0"

  acl                     = "private"
  block_public_acls       = true
  block_public_policy     = true
  bucket                  = "${local.name}-s3-notification-terraform-state"
  ignore_public_acls      = true
  restrict_public_buckets = true
  tags                    = local.common_tags
  versioning = {
    enabled = true
  }
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}
