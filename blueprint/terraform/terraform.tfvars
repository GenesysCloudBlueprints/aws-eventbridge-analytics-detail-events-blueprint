# Genesys Cloud variables

integration_name    = "Conversation Detail EventBridge Source"
event_source_suffix = "conversation-detail-events"
# Event topics to subsribe to. Possible values can be found at https://developer.genesys.cloud/api/rest/v2/notifications/available_topics
topic_filters = [
  "v2.detail.events.conversation.{id}.acd.end",
  "v2.detail.events.conversation.{id}.acd.start",
  "v2.detail.events.conversation.{id}.acw",
  "v2.detail.events.conversation.{id}.attributes",
  "v2.detail.events.conversation.{id}.customer.end",
  "v2.detail.events.conversation.{id}.customer.start",
  "v2.detail.events.conversation.{id}.flow.end",
  "v2.detail.events.conversation.{id}.flow.start",
  "v2.detail.events.conversation.{id}.outbound",
  "v2.detail.events.conversation.{id}.user.end",
  "v2.detail.events.conversation.{id}.user.start",
  "v2.detail.events.conversation.{id}.voicemail.end",
  "v2.detail.events.conversation.{id}.voicemail.start"
]

# AWS variables

s3_bucket_name = "conversation-detail-events-bucket"
# Events will appear under this directory in S3
s3_firehose_prefix = "conversation-detail-events/"
# Events will take at least s3_firehose_buffer_interval seconds to appear in S3. 60 seconds is the minumum
s3_firehose_buffer_interval = 60
# Buffer size in MB. Events will be delivered to S3 if the total size in the buffer is greater than this number
# or at least s3_firehose_buffer_interval seconds has elapsed, whatever happens first
s3_firehose_buffer_size = 1

# Common variables

# Region of the AWS account
aws_account_region = "us-east-1"