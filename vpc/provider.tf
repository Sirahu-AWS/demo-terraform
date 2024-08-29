#Version Constraint
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.24.0"
    }
  }

  required_version = "1.9.5"
}

#AWS Provider
provider "aws" {
  region     = "us-east-1"
}
