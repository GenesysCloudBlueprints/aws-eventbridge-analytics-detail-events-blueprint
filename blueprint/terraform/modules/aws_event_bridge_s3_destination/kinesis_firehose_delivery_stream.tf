resource "aws_kinesis_firehose_delivery_stream" "aws-eventbridge-blueprint-kinesis-delivery-stream" {
  name        = "aws-eventbridge-blueprint-kinesis-delivery-stream"
  destination = "s3"

  s3_configuration {
    role_arn           = aws_iam_role.aws-eventbridge-blueprint-s3-target-role.arn
    bucket_arn         = aws_s3_bucket.aws-eventbridge-blueprint-s3-bucket.arn
    compression_format = "UNCOMPRESSED"
    prefix             = var.s3_firehose_prefix
    buffer_interval    = var.s3_firehose_buffer_interval
    buffer_size        = var.s3_firehose_buffer_size
  }

  kinesis_source_configuration {
    kinesis_stream_arn = aws_kinesis_stream.aws-eventbridge-blueprint-kinesis-stream.arn
    role_arn           = aws_iam_role.aws-eventbridge-blueprint-firehouse-target-role.arn
  }
}