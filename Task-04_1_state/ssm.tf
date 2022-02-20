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

resource "aws_ssm_parameter" "ddb_state_lock_vpc_name" {
  name        = "/srec/ddb/statefile/vpc"
  description = "bucket name for TF vpc ddb"
  type        = "String"
  value       = aws_dynamodb_table.sre_challenge_vpc_ddb_tf_state_lock.id

  tags = local.common_tags
}

resource "aws_ssm_parameter" "ddb_state_lock_s3_notification_name" {
  name        = "/srec/ddb/statefile/s3notification"
  description = "bucket name for TF s3 notification ddb"
  type        = "String"
  value       = aws_dynamodb_table.sre_challenge_s3_notification_ddb_tf_state_lock.id

  tags = local.common_tags
}
