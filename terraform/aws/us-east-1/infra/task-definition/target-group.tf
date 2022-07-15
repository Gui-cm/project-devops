resource "aws_lb" "lb" {
  #for_each = data.aws_subnet_ids.pub
  name            = "ecs-lb"
  subnets         = [for s in data.aws_subnet_ids.pub.ids : s if replace(s, "-lb-", "") == s]
  security_groups = [module.sg.security_group_id]
}

resource "aws_lb_listener" "lb_listener" {
  #for_each = data.aws_subnet_ids.pub
  load_balancer_arn = aws_lb.lb.id
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = module.acm_request_certificate.arn
  default_action {
    target_group_arn = aws_lb_target_group.tg.id
    type             = "forward"
  }
}

resource "aws_lb_target_group" "tg" {
  name        = lower("${var.tags.Name}")
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.aws_vpc.my_vpc.id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    path                = "/api"
    protocol            = "HTTP"
    interval            = 30
    matcher             = 200
  }

  tags = var.tags
}
