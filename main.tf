provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id = true
  s3_use_path_style = true
  # Use custom endpoints for specific AWS services
  endpoints {
    s3 = "http://localhost:4566"
    sqs = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
}

resource "aws_sqs_queue" "example" {
  name = "example-queue"
}

resource "aws_s3_bucket_notification" "example" {
  bucket = aws_s3_bucket.example.id

  queue {
    queue_arn = aws_sqs_queue.example.arn
    events    = ["s3:ObjectCreated:*"]
  }
}
