variable "aws_region" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "cidr_block" {
  type        = string
  description = "VPC cidr block. Example: 10.0.0.0/16"
}

variable "vpc_name" {
  type = string
}