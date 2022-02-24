resource "aws_kinesis_stream" "aws-eventbridge-blueprint-kinesis-stream" {
  name        = "aws-eventbridge-blueprint-kinesis-stream"
  shard_count = 1
}