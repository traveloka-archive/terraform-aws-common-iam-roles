variable "trusted_users" {
  description = "List of ARNs of users that are granted to assume the role."
  type        = "list"
}

variable "mfa_required" {
  description = "Require MFA to assume the role."
  type        = "string"
  default     = "true"
}

variable "role_max_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  type        = "string"
  default     = 3600
}
