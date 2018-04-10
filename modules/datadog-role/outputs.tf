output "aws_account_id" {
  description = "The AWS Account ID number of the account that owns or contains the calling entity."
  value       = "${module.datadog_role.aws_account_id}"
}

output "aws_caller_arn" {
  description = "The AWS ARN associated with the calling entity."
  value       = "${module.datadog_role.aws_caller_arn}"
}

output "aws_caller_user_id" {
  description = "The unique identifier of the calling entity."
  value       = "${module.datadog_role.aws_caller_user_id}"
}

output "role_name" {
  description = "The name of the role."
  value       = "${module.datadog_role.role_name}"
}

output "role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = "${module.datadog_role.role_arn}"
}

output "role_description" {
  description = "The description of the role."
  value       = "${module.datadog_role.role_description}"
}

output "role_create_date" {
  description = "The creation date of the IAM role."
  value       = "${module.datadog_role.role_create_date}"
}

output "role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = "${module.datadog_role.role_unique_id}"
}

