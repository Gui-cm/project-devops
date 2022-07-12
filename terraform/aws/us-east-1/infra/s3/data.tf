data "aws_canonical_user_id" "current" {}

data "template_file" "bucket" {
  template = file("${path.module}/policies/iam.json")

  vars = {
    bucket = lower("arn:aws:s3:::project-devops-frontend-gcm")
  }
}
