resource "aws_sns_topic" "s3_object_upload_sns_topic" {
  name = "s3-object-upload-notifications"
}

resource "aws_sns_topic_policy" "my_sns_topic_policy" {
  arn    = aws_sns_topic.s3_object_upload_sns_topic.arn
  policy = data.aws_iam_policy_document.s3_object_upload_sns_policy_document.json
}

data "aws_iam_policy_document" "s3_object_upload_sns_policy_document" {
  policy_id = "s3_object_upload_policy_ID"

  statement {
    actions = [
      "SNS:Publish",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceAccount"
      values = [
        local.account_id,
      ]
    }


    effect = "Allow"

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values = [
        "${module.s3_notification.s3_bucket_arn}"
      ]
    }

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    resources = [
      aws_sns_topic.s3_object_upload_sns_topic.arn,
    ]

    sid = "s3_object_upload_sns_topic_statement_ID"
  }
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.s3_object_upload_sns_topic.arn
  protocol  = "email"
  endpoint  = "d.tech.simpson@gmail.com"
}
