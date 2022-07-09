resource "aws_ecs_task_definition" "project_devops" {
  family                = lower("${var.tags.Name}-${var.tags.Service}")
  container_definitions = data.template_file.service_template.rendered
  task_role_arn         = module.role.iam_role_arn

  tags = var.tags
}

resource "aws_ecs_service" "ecs_service" {
  name            = lower("ecs-service-${var.tags.Name}")
  cluster         = lower("cluster-${var.tags.Name}")
  task_definition = aws_ecs_task_definition.project_devops.family
  desired_count   = var.service_desired_count
  iam_role        = module.role.iam_role_arn

  load_balancer {
    target_group_arn = aws_alb_target_group.tg.arn
    container_name   = lower(var.tags.Name)
    container_port   = aws_ssm_parameter.container_port.value
  }

  tags = var.tags

  depends_on = [aws_alb_target_group.tg]
}
