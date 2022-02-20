output "tfstate_vpc_bucket_name" {
  description = "The name of the vpc TF state bucket."
  value       = module.s3_tfstate_bucket_vpc.s3_bucket_id
}

output "tfstate_s3_notification_bucket_name" {
  description = "The name of the s3 notification TF state bucket."
  value       = module.s3_tfstate_bucket_s3_notification.s3_bucket_id
}


output "ddb_state_lock_vpc_name" {
  description = "The name of the ddb table name for vpc."
  value       = aws_dynamodb_table.sre_challenge_vpc_ddb_tf_state_lock.id
}


output "ddb_state_lock_s3_notification_name" {
  description = "The name of the ddb table name for s3 notification."
  value       = aws_dynamodb_table.sre_challenge_s3_notification_ddb_tf_state_lock.id
}
