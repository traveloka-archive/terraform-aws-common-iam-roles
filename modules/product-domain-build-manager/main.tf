module "this" {
  source = "github.com/traveloka/terraform-aws-iam-role.git//modules/user?ref=v0.5.1"

  role_name                  = "ProductDomainBuildManager_${var.product_domain}"
  role_description           = "Role for Build Manager of ${var.product_domain} Product Domain"
  role_force_detach_policies = "true"

  trusted_users             = ["${var.trusted_users}"]
  mfa_required              = "${var.mfa_required}"
  role_max_session_duration = "${var.role_max_session_duration}"
}

resource "aws_iam_role_policy" "pdbm_codepipeline" {
  name   = "AllowToManageCodepipeline"
  role   = "${module.this.role_name}"
  policy = "${data.aws_iam_policy_document.codepipeline.json}"
}

resource "aws_iam_role_policy" "pdbm_codebuild" {
  name   = "AllowToManageCodebuild"
  role   = "${module.this.role_name}"
  policy = "${data.aws_iam_policy_document.codebuild.json}"
}

resource "aws_iam_role_policy" "pdbm_cloudwatch_logs" {
  name   = "AllowToManageCloudwatchLogs"
  role   = "${module.this.role_name}"
  policy = "${data.aws_iam_policy_document.cloudwatch_logs.json}"
}

resource "aws_iam_role_policy" "pdbm_s3" {
  name   = "AllowToAccessS3"
  role   = "${module.this.role_name}"
  policy = "${data.aws_iam_policy_document.s3.json}"
}

resource "aws_iam_role_policy" "pdbm_ssm" {
  name   = "AllowToAccessSSM"
  role   = "${module.this.role_name}"
  policy = "${data.aws_iam_policy_document.ssm.json}"
}

resource "aws_iam_role_policy" "pdbm_dynamodb" {
  name   = "AllowToAccessDynamoDB"
  role   = "${module.this.role_name}"
  policy = "${data.aws_iam_policy_document.dynamodb.json}"
}

resource "aws_iam_role_policy" "pdbm_ami" {
  name   = "AllowToDeregisterAMI"
  role   = "${module.this.role_name}"
  policy = "${data.aws_iam_policy_document.ami.json}"
}
