resource "aws_route53_zone" "main" {
  name = "guicmtech.com.br"

  tags = var.tags
}
