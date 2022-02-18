resource "aws_dynamodb_table" "sre_challenge_vpc_ddb_tf_state_lock" {
  name           = "${local.name}-tf-state-lock-ddb-vpc"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = local.common_tags
}

resource "aws_dynamodb_table" "sre_challenge_s3_notification_ddb_tf_state_lock" {
  name           = "${local.name}-tf-state-lock-ddb-s3-notification"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}