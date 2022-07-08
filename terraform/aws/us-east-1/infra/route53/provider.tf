provider "aws" {
  version = "~> 3.74.1"
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::590284024382:role/admin-role"
  }
}

remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "terraform-state"
    dynamodb_table = "terraform_lock"
    region         = "us-east-1"
    key            = "terraform/aws/us-east-1/infra/terraform.tfstate"
    role_arn       = ""
  }
}