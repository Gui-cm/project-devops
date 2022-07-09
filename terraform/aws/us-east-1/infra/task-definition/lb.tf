module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = lower("alb-${var.tags.Name}")

  load_balancer_type = "application"

  vpc_id          = data.aws_vpc.vpc.id
  subnets         = ["subnet-07d7c0766477f83f5"]
  security_groups = ["sg-edcd9784", "sg-edcd9785"]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = module.acm_request_certificate.arn
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = var.tags
}
