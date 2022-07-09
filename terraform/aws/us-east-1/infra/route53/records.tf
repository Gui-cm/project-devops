module "records" {
  source = "github.com/terraform-aws-modules/terraform-aws-route53//modules/records?ref=v2.0.0"

  create = true

  zone_id = data.aws_route53_zone.guicmtech.zone_id
  records = [
    {
      name    = "wwww"
      type    = "CNAME"
      ttl     = 300
      records = ["guicmtech.com.br"]
    }
  ]
}
