# This example was created using terraform-provider-aws version 1.13.0 at 2018/04/09.
provider "aws" {
  version = "~> 1.13.0"
  region  = "ap-southeast-1"
}

module "this" {
  # In actual use case, you have to replace this line with: source = "github.com/traveloka/terraform-aws-common-iam-roles.git//modules/datadog-integration?ref=v0.1.0"
  source = "../../modules/datadog-integration"

  external_id = "2ce986a8821c412ebec3231d6564856c"
}
