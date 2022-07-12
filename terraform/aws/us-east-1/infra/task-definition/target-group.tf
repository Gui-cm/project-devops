resource "aws_lb" "lb" {
  name            = "ecs-lb"
  subnets         = ["subnet-0e0c9603e4dc8efbf", "subnet-08d9c1f703ea5471c"]
  security_groups = [module.sg.security_group_id]
}

resource "aws_lb_listener" "hello_world" {
  load_balancer_arn = aws_lb.lb.id
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "arn:aws:acm:us-east-1:593387113088:certificate/17dd61f5-999e-483f-b951-1b5a67d415cf"

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
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    matcher             = 200
  }

  tags = var.tags
}
