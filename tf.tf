resource "aws_s3_bucket" "target_bucket" {
  bucket = "unique-target-bucket"  # Change this to your desired target bucket name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_account_public_access_block" "public_access_block" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "unique-bucket1"  # Change this to your desired bucket name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable access logging using the target_bucket
  logging {
    target_bucket = aws_s3_bucket.target_bucket.id
    target_prefix = "bucket1-logs/"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "unique-bucket2"  # Change this to your desired bucket name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable access logging using the target_bucket
  logging {
    target_bucket = aws_s3_bucket.target_bucket.id
    target_prefix = "bucket2-logs/"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "bucket3" {
  bucket = "unique-bucket3"  # Change this to your desired bucket name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable access logging using the target_bucket
  logging {
    target_bucket = aws_s3_bucket.target_bucket.id
    target_prefix = "bucket3-logs/"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_sqs_queue" "encrypted_queue" {
  name            = "my-encrypted-queue"
  kms_master_key_id = aws_kms_key.my_key.id
}

resource "aws_sns_topic" "my_topic" {
  name = "my-topic"
}

resource "aws_sns_topic_subscription" "sqs_subscription" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.encrypted_queue.arn
}

resource "aws_sns_platform_application" "my_platform_app" {
  name     = "my-platform-app"
  platform = "APNS"  # Change this to the desired platform (e.g., "APNS" for Apple Push Notification Service)
  platform_credential = "<APNS PRIVATE KEY>"
  platform_principal  = "<APNS CERTIFICATE>"
}

resource "aws_sns_platform_endpoint" "my_platform_endpoint" {
  platform_application_arn = aws_sns_platform_application.my_platform_app.arn
  custom_user_data         = "my-custom-data"
  token                    = "my-platform-endpoint-token"
  kms_master_key_id        = aws_kms_key.my_key.id
}

resource "aws_kms_key" "my_key" {
  description = "My KMS key"
}

resource "aws_s3_bucket" "target_bucket" {
  bucket = "unique-target-bucket"  # Change this to your desired target bucket name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_account_public_access_block" "public_access_block" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "unique-bucket1"  # Change this to your desired bucket name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable access logging using the target_bucket
  logging {
    target_bucket = aws_s3_bucket.target_bucket.id
    target_prefix = "bucket1-logs/"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "unique-bucket2"  # Change this to your desired bucket name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable access logging using the target_bucket
  logging {
    target_bucket = aws_s3_bucket.target_bucket.id
    target_prefix = "bucket2-logs/"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "bucket3" {
  bucket = "unique-bucket3"  # Change this to your desired bucket name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable access logging using the target_bucket
  logging {
    target_bucket = aws_s3_bucket.target_bucket.id
    target_prefix = "bucket3-logs/"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_sqs_queue" "encrypted_queue" {
  name            = "my-encrypted-queue"
  kms_master_key_id = aws_kms_key.my_key.id
}

resource "aws_sns_topic" "my_topic" {
  name = "my-topic"
}

resource "aws_sns_topic_subscription" "sqs_subscription" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.encrypted_queue.arn
}

resource "aws_sns_platform_application" "my_platform_app" {
  name     = "my-platform-app"
  platform = "APNS"  # Change this to the desired platform (e.g., "APNS" for Apple Push Notification Service)
  platform_credential = "<APNS PRIVATE KEY>"
  platform_principal  = "<APNS CERTIFICATE>"
}

resource "aws_sns_platform_endpoint" "my_platform_endpoint" {
  platform_application_arn = aws_sns_platform_application.my_platform_app.arn
  custom_user_data         = "my-custom-data"
  token                    = "my-platform-endpoint-token"
  kms_master_key_id        = aws_kms_key.my_key.id
}

resource "aws_kms_key" "my_key" {
  description = "My KMS key"
}
