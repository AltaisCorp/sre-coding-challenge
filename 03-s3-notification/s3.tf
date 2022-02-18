resource "random_string" "unique" {
  length  = 4
  upper   = false
  special = false
}

module "s3_notification" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.9.0"

  acl                     = "private"
  block_public_acls       = true
  block_public_policy     = true
  bucket                  = "${local.name}-vpc-tf-state-${random_string.unique.id}"
  ignore_public_acls      = true
  restrict_public_buckets = true
  tags                    = local.common_tags
  versioning = {
    enabled = false
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  depends_on   = [aws_sns_topic.s3_object_upload_sns_topic]
  bucket = module.s3_notification.s3_bucket_id

  topic {
    topic_arn     = aws_sns_topic.s3_object_upload_sns_topic.arn
    events        = ["s3:ObjectCreated:*"]
  }
}