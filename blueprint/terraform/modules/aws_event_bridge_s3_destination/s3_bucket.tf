resource "aws_s3_bucket" "aws-eventbridge-blueprint-s3-bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = true
}