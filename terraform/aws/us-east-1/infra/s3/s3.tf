module "bucket" {
  source = "github.com/terraform-aws-modules/terraform-aws-s3-bucket?ref=v3.0.1"

  create_bucket = true

  bucket = lower("${var.tags.Name}-frontend-gcm")
  acl    = null

  tags = var.tags
}
