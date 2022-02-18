resource "aws_dynamodb_table" "sre_challenge_vpc_ddb_tf_state_lock" {
  name           = "${local.name}-vpc-terraform-state-lock-ddb"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
