resource "aws_ecs_task_definition" "project_devops" {
  family                   = "project-devops-app"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = "arn:aws:iam::593387113088:role/ecsTaskExecutionRole"
  container_definitions    = <<DEFINITION
  [
    {
      "image": "guizinmoraes/python-flask-1:main",
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
  task_role_arn            = "arn:aws:iam::593387113088:role/ecsTaskExecutionRole"

  tags = var.tags
}

resource "aws_ecs_service" "hello_world" {

  name            = lower("ecs-service-${var.tags.Name}")
  cluster         = lower("cluster-${var.tags.Name}")
  task_definition = aws_ecs_task_definition.project_devops.arn
  desired_count   = var.service_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [module.sg.security_group_id]
    subnets         = ["subnet-0df2933287dcba55a", "subnet-0952cf56abf58ef20"]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.id
    container_name   = "project-devops-app"
    container_port   = 80
  }

  depends_on = [aws_lb_listener.hello_world]
}
