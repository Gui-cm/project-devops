module "acm_request_certificate" {
  source = "cloudposse/acm-request-certificate/aws"

  domain_name                       = "guicmtech.com.br"
  process_domain_validation_options = true
  ttl                               = "300"
  subject_alternative_names         = ["*.guicmtech.com.br"]
}
