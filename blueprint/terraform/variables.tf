# Genesys Cloud variables

variable "integration_name" {
  type    = string
  default = "Amazon EventBridge Source"
}

variable "topic_filters" {
  type = list(string)
}

variable "event_source_suffix" {
  type = string
}

# AWS variables

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

# Common variables

variable "aws_account_region" {
  type = string
}