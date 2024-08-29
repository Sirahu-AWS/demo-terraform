#VPC-01
resource "aws_vpc" "demo-vpc-01" {
  cidr_block           = "${var.vpc-cidr-01}/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = var.vpc-name-01
  }
}
