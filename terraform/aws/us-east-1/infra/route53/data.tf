data "aws_route53_zone" "getninjas_io" {
  name         = "getninjas.io"
  private_zone = false
}