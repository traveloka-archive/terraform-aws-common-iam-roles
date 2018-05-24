module "this" {
  source = "github.com/traveloka/terraform-aws-iam-role.git//modules/user?ref=v0.4.3"

  role_name                  = "BillingUser"
  role_description           = "Role for accessing Billing and Cost Management dashboard"
  role_force_detach_policies = "true"

  trusted_users             = ["${var.trusted_users}"]
  mfa_required              = "${var.mfa_required}"
  role_max_session_duration = "${var.role_max_session_duration}"
}

data "aws_iam_policy_document" "bua_pdoc" {
  statement = {
    sid = "AllowView"

    actions = [
      "aws-portal:ViewAccount",
      "aws-portal:ViewBilling",
      "aws-portal:ViewBudget",
      "aws-portal:ViewPaymentMethods",
      "aws-portal:ViewUsage",
    ]

    resources = [
      "*",
    ]
  }

  statement = {
    sid    = "DenyModify"
    effect = "Deny"

    actions = [
      "aws-portal:Modify*",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role_policy" "bua" {
  name   = "BillingUserAccess"
  role   = "${module.this.role_name}"
  policy = "${data.aws_iam_policy_document.bua_pdoc.json}"
}
