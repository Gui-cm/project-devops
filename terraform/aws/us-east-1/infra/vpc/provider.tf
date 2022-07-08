provider "aws" {
  version = ">= 3.75.0"
  region = "us-east-1"
  profile = "project-devops"
  assume_role {
    role_arn = "arn:aws:iam::593387113088:role/admin-role"
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-state-gcm"
    key    = "project-devops/terraform/aws/us-east-1/infra/vpc/terraform.state"
    region = "us-east-1"
  }
}