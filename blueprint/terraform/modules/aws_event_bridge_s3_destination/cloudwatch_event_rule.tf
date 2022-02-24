resource "aws_cloudwatch_event_rule" "aws-eventbridge-blueprint-event-rule" {
  name           = "aws-eventbridge-blueprint-event-rule"
  event_bus_name = "aws.partner/genesys.com/cloud/${var.genesys_cloud_org_id}/${var.event_source_suffix}"
  event_pattern  = <<EOF
{
  "account": [
    "${var.aws_account_id}"
  ]
}
EOF

  depends_on = [
    aws_cloudwatch_event_bus.aws-eventbridge-blueprint-event-bus
  ]
}