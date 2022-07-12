module "s3" {
  source = "github.com/terraform-aws-modules/terraform-aws-s3-bucket?ref=v2.1.0"

  bucket = lower("${var.tags.Name}-frontend-gcm")
  acl    = null

  attach_policy = true
  policy        = data.template_file.bucket.rendered

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  website = {
    index_document = "index.html"
  }

  tags = var.tags

}
