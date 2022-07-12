data "aws_route53_zone" "guicmtech" {
  name         = "guicmtech.com.br"
  private_zone = false
}

data "aws_cloudfront_distribution" "cdn_arn" {
  id = "E3H66VI2D8BVB3"
}
