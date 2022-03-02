# Genesys Cloud Event Bridge Integration Module 
module "aws_event_bridge_integration" {
  source              = "git::https://github.com/GenesysCloudDevOps/aws-event-bridge-module.git"
  aws_account_id      = var.aws_account_id
  integration_name    = var.integration_name
  aws_account_region  = var.aws_account_region
  event_source_suffix = var.event_source_suffix
  topic_filters       = var.topic_filters
}