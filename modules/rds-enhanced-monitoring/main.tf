module "this" {
  source = "github.com/traveloka/terraform-aws-iam-role.git//modules/service?ref=v0.2.0"

  role_identifier            = "RDS Enhanced Monitoring"
  role_description           = "Service Role for RDS Enhanced Monitoring"
  role_force_detach_policies = true
  aws_service                = "monitoring.rds.amazonaws.com"
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = "${module.this.role_name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}
