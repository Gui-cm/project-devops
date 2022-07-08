provider "aws" {
  version = ">= 3.75.0"
  region  = "us-east-1"
  profile = "project-devops"
  #assume_role {
    #role_arn = "arn:aws:iam::590284024382:role/admin-role"
  #}
}