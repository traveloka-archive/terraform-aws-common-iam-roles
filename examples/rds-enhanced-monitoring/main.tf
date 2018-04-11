provider "aws" {
  version = "1.13.0"
  region  = "ap-southeast-1"
}

module "rds_enhanced_monitoring" {
  source = "../../modules/rds-enhanced-monitoring"
}
