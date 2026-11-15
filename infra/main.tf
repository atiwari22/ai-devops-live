locals {
  # Required on every AWS resource. See CLAUDE.md.
  common_tags = {
    Project = var.project_name
    owner   = var.owner
    Env     = var.environment
  }
}

# Official VPC module, version pinned. Credentials come from the environment,
# not from this file.
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3"

  name = var.project_name
  cidr = "10.0.0.0/16"

  azs            = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  # Demo does not need private subnets. Leaving NAT off avoids that hourly cost.
  enable_nat_gateway = false

  tags = local.common_tags
}
