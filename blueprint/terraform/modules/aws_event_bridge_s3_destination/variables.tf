variable "aws_account_region" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "genesys_cloud_org_id" {
  type = string
}

variable "event_source_suffix" {
  type = string
}

variable "s3_bucket_name" {
  type = string
}

variable "s3_firehose_prefix" {
  type = string
}

variable "s3_firehose_buffer_interval" {
  type = number
}

variable "s3_firehose_buffer_size" {
  type = number
}
