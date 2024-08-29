#VPC-01
resource "aws_vpc" "demo-vpc-01" {
  cidr_block           = "${var.vpc_cidr_01}/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = var.vpc_name_01
  }
}
