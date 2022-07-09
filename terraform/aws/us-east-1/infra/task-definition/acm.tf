module "acm_request_certificate" {
  source = "cloudposse/acm-request-certificate/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version = "x.x.x"
  domain_name                       = "example.com"
  process_domain_validation_options = true
  ttl                               = "300"
}
