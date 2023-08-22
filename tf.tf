resource "aws_sns_topic" "example_topic" {
  name = "example-topic"
}

resource "aws_sqs_queue" "example_queue" {
  name = "example-queue"
}

resource "aws_sns_topic_subscription" "example_subscription" {
  topic_arn = aws_sns_topic.example_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.example_queue.arn
}

resource "aws_sns_platform_application" "example_platform_app" {
  name     = "example-platform-app"
  platform = "GCM"
}

resource "aws_sns_platform_endpoint" "example_platform_endpoint" {
  platform_application = aws_sns_platform_application.example_platform_app.arn
  token                = var.device_token
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}

resource "aws_iam_role" "example_iam_role" {
  name = "example-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "sns.amazonaws.com",
        },
      },
    ],
  })
}

resource "aws_iam_policy" "example_s3_policy" {
  name = "example-s3-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Effect   = "Allow",
        Resource = "${aws_s3_bucket.example_bucket.arn}/*",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "example_s3_policy_attachment" {
  policy_arn = aws_iam_policy.example_s3_policy.arn
  role       = aws_iam_role.example_iam_role.name
}
