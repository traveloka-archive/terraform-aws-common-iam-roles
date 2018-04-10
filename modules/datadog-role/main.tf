# This module was updated using terraform 0.11.4 at 2018/04/09.
terraform {
  required_version = ">= 0.11.4"
}

locals {
  datadog_account_id = "464622532012"
}

data "aws_iam_policy_document" "datadog_privilege_doc" {
  statement {
    sid = "1"

    actions = [
      "autoscaling:Describe*",
      "budgets:ViewBudget",
      "cloudfront:GetDistributionConfig",
      "cloudfront:ListDistributions",
      "cloudtrail:DescribeTrails",
      "cloudtrail:GetTrailStatus",
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*",
      "codedeploy:List*",
      "codedeploy:BatchGet*",
      "directconnect:Describe*",
      "dynamodb:List*",
      "dynamodb:Describe*",
      "ec2:Describe*",
      "ecs:Describe*",
      "ecs:List*",
      "elasticache:Describe*",
      "elasticache:List*",
      "elasticfilesystem:DescribeFileSystems",
      "elasticfilesystem:DescribeTags",
      "elasticloadbalancing:Describe*",
      "elasticmapreduce:List*",
      "elasticmapreduce:Describe*",
      "es:ListTags",
      "es:ListDomainNames",
      "es:DescribeElasticsearchDomains",
      "health:DescribeEvents",
      "health:DescribeEventDetails",
      "health:DescribeAffectedEntities",
      "kinesis:List*",
      "kinesis:Describe*",
      "lambda:AddPermission",
      "lambda:GetPolicy",
      "lambda:List*",
      "lambda:RemovePermission",
      "logs:Get*",
      "logs:Describe*",
      "logs:FilterLogEvents",
      "logs:TestMetricFilter",
      "rds:Describe*",
      "rds:List*",
      "redshift:DescribeClusters",
      "redshift:DescribeLoggingStatus",
      "route53:List*",
      "s3:GetBucketLogging",
      "s3:GetBucketLocation",
      "s3:GetBucketNotification",
      "s3:GetBucketTagging",
      "s3:ListAllMyBuckets",
      "s3:PutBucketNotification",
      "ses:Get*",
      "sns:List*",
      "sns:Publish",
      "sqs:ListQueues",
      "support:*",
      "tag:getResources",
      "tag:getTagKeys",
      "tag:getTagValues"
    ]

    resources = [
      "*",
    ]
  }
}

# Provides an IAM role.
module "datadog_role" {
  source = "github.com/traveloka/terraform-aws-iam-role.git//modules/external?ref=v0.2.0"

  role_name                  = "DatadogRole"
  role_description           = "Role for Datadog-AWS integration"
  role_force_detach_policies = true
  account_id                 = "${local.datadog_account_id}"
  external_id                = "${var.external_id}"
}

# create policy
resource "aws_iam_role_policy" "this" {
  role   = "${module.datadog_role.role_name}"
  policy = "${data.aws_iam_policy_document.datadog_privilege_doc.json}"
}

