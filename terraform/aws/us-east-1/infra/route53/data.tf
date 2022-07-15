data "aws_route53_zone" "guicmtech" {
  name         = "guicmtech.com.br"
  private_zone = false
}
