# aws_account_identity is used to get the AWS account ID used by the AWS and Genesys Cloud modules
module "aws_account_identity" {
  source             = "./modules/aws_account_identity"
  aws_account_region = var.aws_account_region
}

# genesys_cloud_event_bridge_integration manages the Event Bridge integration on the Genesys Cloud side
module "genesys_cloud_event_bridge_integration" {
  source              = "./modules/genesys_cloud_event_bridge_integration"
  aws_account_id      = module.aws_account_identity.account_id
  aws_account_region  = var.aws_account_region
  integration_name    = var.integration_name
  topic_filters       = var.topic_filters
  event_source_suffix = var.event_source_suffix
}

# aws_event_bridge_s3_destination manages the AWS side of this blueprint from the Event Bridge integration through to the S3 bucket
module "aws_event_bridge_s3_destination" {
  source                      = "./modules/aws_event_bridge_s3_destination"
  aws_account_id              = module.aws_account_identity.account_id
  genesys_cloud_org_id        = module.genesys_cloud_event_bridge_integration.genesys_cloud_org_id
  aws_account_region          = var.aws_account_region
  event_source_suffix         = var.event_source_suffix
  s3_bucket_name              = var.s3_bucket_name
  s3_firehose_prefix          = var.s3_firehose_prefix
  s3_firehose_buffer_interval = var.s3_firehose_buffer_interval
  s3_firehose_buffer_size     = var.s3_firehose_buffer_size
  # It seems that the implicit dependency on genesys_cloud_event_bridge_integration through the genesys_cloud_org_id isn't enough
  depends_on = [
    module.genesys_cloud_event_bridge_integration
  ]
}