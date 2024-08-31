terraform {
  backend "s3" {
    bucket = "maxx-demo-tf-state"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}