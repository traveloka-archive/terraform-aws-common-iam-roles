output "aws_account_id" {
  description = "The AWS Account ID number of the account that owns or contains the calling entity."
  value       = "${data.aws_caller_identity.current.account_id}"
}

output "aws_caller_arn" {
  description = "The AWS ARN associated with the calling entity."
  value       = "${data.aws_caller_identity.current.arn}"
}

output "aws_caller_user_id" {
  description = "The unique identifier of the calling entity."
  value       = "${data.aws_caller_identity.current.user_id}"
}

output "region_name" {
  description = "The name of the selected region."
  value       = "${data.aws_region.current.name}"
}

output "role_name" {
  description = "The name of the role."
  value       = "${aws_iam_role.product_domain_build_manager.name}"
}

output "role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = "${aws_iam_role.product_domain_build_manager.arn}"
}

output "role_description" {
  description = "The description of the role."
  value       = "${aws_iam_role.product_domain_build_manager.description}"
}

output "role_create_date" {
  description = "The creation date of the IAM role."
  value       = "${aws_iam_role.product_domain_build_manager.create_date}"
}

output "role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = "${aws_iam_role.product_domain_build_manager.unique_id}"
}
