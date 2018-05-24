provider "aws" {
  version = "1.20.0"
  region  = "ap-southeast-1"
}

module "billing_user_role" {
  source = "../../modules/billing-user"

  # List of trusted users
  trusted_users = [
    "arn:aws:iam::123456789012:user/john.doe",
  ]
}
