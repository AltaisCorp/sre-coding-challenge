resource "aws_ssm_parameter" "s3_tfstate_bucket_vpc" {
  name        = "/srec/s3/statefile/vpc"
  description = "bucket name for TF vpc statefile"
  type        = "String"
  value       = module.s3_tfstate_bucket_vpc.s3_bucket_id

  tags = local.common_tags
}

resource "aws_ssm_parameter" "s3_tfstate_bucket_s3_notification" {
  name        = "/srec/s3/statefile/s3notification"
  description = "bucket name for TF s3 notification statefile"
  type        = "String"
  value       = module.s3_tfstate_bucket_s3_notification.s3_bucket_id

  tags = local.common_tags
}