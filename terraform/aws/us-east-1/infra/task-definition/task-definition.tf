resource "aws_ecs_task_definition" "project_devops" {
  family                   = lower("${var.tags.Name}-app")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = module.role.iam_role_arn
  container_definitions    = <<DEFINITION
  [
    {
      "image": "593387113088.dkr.ecr.us-east-1.amazonaws.com/python-flask:latest",
      "cpu": 1024,
      "memory": 2048,
      "name": "project-devops-app",
      "networkMode": "awsvpc",
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ],
      "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-create-group": "true",
                    "awslogs-group": "awslogs-project-devops",
                    "awslogs-region": "us-east-1",
                    "awslogs-stream-prefix": "awslogs-python"
                }
            }
    }
  ]
  DEFINITION
  task_role_arn            = module.role.iam_role_arn

  tags = var.tags
}

resource "aws_ecs_service" "ecs_service" {

  name            = lower("ecs-service-${var.tags.Name}")
  cluster         = lower("cluster-${var.tags.Name}")
  task_definition = aws_ecs_task_definition.project_devops.arn
  desired_count   = var.service_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [module.sg.security_group_id]
    subnets         = [for s in data.aws_subnet_ids.prv.ids : s if replace(s, "-lb-", "") == s]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.id
    container_name   = lower("${var.tags.Name}-app")
    container_port   = 80
  }

  depends_on = [aws_lb_listener.lb_listener]
}
