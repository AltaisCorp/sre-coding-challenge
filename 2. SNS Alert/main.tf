resource "aws_sns_topic" "topic" {
  name = "s3-event-notification-topic"

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[{
        "Effect": "Allow",
        "Principal": { "Service": "s3.amazonaws.com" },
        "Action": "SNS:Publish",
        "Resource": "arn:aws:sns:*:*:s3-event-notification-topic",
        "Condition":{
            "ArnLike":{"aws:SourceArn":"${aws_s3_bucket.altair-oloye.arn}"}
        }
    }]
}
POLICY
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.altair-oloye.id

  topic {
    topic_arn     = aws_sns_topic.topic.arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".txt"
  }
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = "funsyte@gmail.com"
}

resource "aws_s3_bucket_object" "news3-object" {
  bucket = aws_s3_bucket.altair-oloye.id
  key    = "sns-test.txt"
  source = "sns-test.txt"
  etag = filemd5("sns-test.txt")
  depends_on = [
    aws_sns_topic_subscription.email-target
    ]
}