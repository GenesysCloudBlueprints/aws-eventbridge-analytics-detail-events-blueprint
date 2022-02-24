resource "aws_cloudwatch_event_bus" "aws-eventbridge-blueprint-event-bus" {
  name              = "aws.partner/genesys.com/cloud/${var.genesys_cloud_org_id}/${var.event_source_suffix}"
  event_source_name = "aws.partner/genesys.com/cloud/${var.genesys_cloud_org_id}/${var.event_source_suffix}"
}