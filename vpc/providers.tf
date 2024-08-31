#Version Constraint
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }

  required_version = "1.9.5"
}

#AWS Provider
provider "aws" {
  region = var.aws_region
}