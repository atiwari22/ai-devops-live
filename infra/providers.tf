provider "aws" {
  region = var.aws_region

  # New resources inherit these tags even if a module forgets its own tags.
  default_tags {
    tags = local.common_tags
  }
}
