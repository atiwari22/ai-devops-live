terraform {
  # Pin the CLI. CI installs this same version.
  required_version = "1.17.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.0"
    }
  }
}
