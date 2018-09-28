provider "aws" {
  version = "1.37.0"
  region  = "ap-southeast-1"
}

module "pdbm_tsi" {
  source = "../../modules/product-domain-build-manager/"

  product_domain              = "tsi"
  terraform_state_bucket_name = "terraform-state-management-dummy"

  trusted_users = [
    "arn:aws:iam::123456789012:user/rafi.putra",
  ]
}
