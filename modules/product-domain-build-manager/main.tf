resource "aws_iam_role" "product_domain_build_manager" {
  name               = "ProductDomainBuildManager_${var.product_domain}"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role.json}"
  description        = "Role for Build Manager of ${var.product_domain} Product Domain"
}

resource "aws_iam_role_policy" "pdbm_codepipeline" {
  name   = "AllowToManageCodepipeline"
  role   = "${aws_iam_role.product_domain_build_manager.name}"
  policy = "${data.aws_iam_policy_document.codepipeline.json}"
}

resource "aws_iam_role_policy" "pdbm_codebuild" {
  name   = "AllowToManageCodebuild"
  role   = "${aws_iam_role.product_domain_build_manager.name}"
  policy = "${data.aws_iam_policy_document.codebuild.json}"
}

resource "aws_iam_role_policy" "pdbm_cloudwatch_logs" {
  name   = "AllowToManageCloudwatchLogs"
  role   = "${aws_iam_role.product_domain_build_manager.name}"
  policy = "${data.aws_iam_policy_document.cloudwatch_logs.json}"
}

resource "aws_iam_role_policy" "pdbm_image" {
  name   = "AllowToManageImage"
  role   = "${aws_iam_role.product_domain_build_manager.name}"
  policy = "${data.aws_iam_policy_document.image.json}"
}
