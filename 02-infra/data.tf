data "aws_ssm_parameter" "s3_tfstate_bucket_vpc" {
  name = "/srec/s3/statefile/vpc"
}

data "aws_ssm_parameter" "s3_tfstate_bucket_s3_notification" {
  name = "/srec/s3/statefile/s3notification"
}

data "aws_ssm_parameter" "ddb_state_lock_vpc_name" {
  name = "/srec/ddb/statefile/vpc"
}

data "aws_ssm_parameter" "ddb_state_lock_s3_notification_name" {
  name = "/srec/ddb/statefile/s3notification"
}
