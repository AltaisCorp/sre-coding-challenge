resource "random_string" "random" {
  length = 6
  special = false
  upper = false
}
resource "aws_s3_bucket" "altaischallengebucket" {
  bucket = "altaischallengebucket-${random_string.random.result}"
}
resource "aws_sqs_queue" "s3q" {
  name = "s3-event-queue"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:s3-event-queue",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.altaischallengebucket.arn}" }
      }
    }
  ]
}
POLICY
}
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.altaischallengebucket.id

  queue {
    queue_arn     = aws_sqs_queue.s3q.arn
    events        = ["s3:ObjectCreated:*"]
  }
}