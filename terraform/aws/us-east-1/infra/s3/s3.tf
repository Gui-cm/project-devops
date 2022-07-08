module "bucket" {
  source = "github.com/terraform-aws-modules/terraform-aws-s3-bucket?ref=v3.0.1"

  for_each = local.buckets

  create_bucket = true

  bucket = each.key
  acl    = null

  tags = var.tags
}