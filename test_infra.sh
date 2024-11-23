#!/bin/bash

# Set up environment
set AWS_ACCESS_KEY_ID=test
set AWS_SECRET_ACCESS_KEY=test
set AWS_DEFAULT_REGION=us-east-1
alias awslocal="aws --endpoint-url=http://localhost:4566"

# List S3 buckets
echo "Listing S3 buckets:"
aws --endpoint-url=http://localhost:4566 s3 ls

# List SQS queues
echo "Listing SQS queues:"
aws --endpoint-url=http://localhost:4566 sqs list-queues

# Upload a file to trigger S3 event
echo "Uploading a test file to S3:"
echo "Hello LocalStack!" > test_file.txt
aws --endpoint-url=http://localhost:4566 s3 cp test_file.txt s3://example-bucket/