resource "aws_alb_target_group" "tg" {
  name     = lower("${var.tags.Name}-${var.tags.Service}")
  port     = aws_ssm_parameter.container_port.value
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.project_devops.id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    path                = "/healthcheck"
    protocol            = "HTTP"
    interval            = 30
    matcher             = 200
  }

  tags = var.tags
}

resource "aws_alb_listener_rule" "alb_listerner_rule" {
  listener_arn = data.aws_ssm_parameter.external_alb_listener_arn_ninja.value

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tg.arn
  }

  condition {
    host_header {
      values = [join(",", var.dns)]
    }
  }

  depends_on = [aws_alb_target_group.tg]
}
