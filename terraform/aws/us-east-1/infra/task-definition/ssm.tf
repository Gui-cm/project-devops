resource "aws_ssm_parameter" "container_cpu" {
  name      = join("", [lower("/smoke/${var.tags.Name}/"), "CONTAINER_CPU_UNITS"])
  type      = "String"
  value     = var.container_cpu
  overwrite = true

  tags = var.tags
}

resource "aws_ssm_parameter" "container_memory" {
  name      = join("", [lower("/smoke/${var.tags.Name}/"), "CONTAINER_MEMORY"])
  type      = "String"
  value     = var.container_memory
  overwrite = true

  tags = var.tags
}

resource "aws_ssm_parameter" "container_memory_reservation" {
  name      = join("", [lower("/smoke/${var.tags.Name}/"), "CONTAINER_MEMORY_RESERVATION"])
  type      = "String"
  value     = var.container_memory_reservation
  overwrite = true

  tags = var.tags
}

resource "aws_ssm_parameter" "container_port" {
  name      = join("", [lower("/smoke/${var.tags.Name}/"), "CONTAINER_PORT"])
  type      = "String"
  value     = var.container_port
  overwrite = true

  tags = var.tags
}

resource "aws_ssm_parameter" "service_type" {
  name      = join("", [lower("/smoke/${var.tags.Name}/"), "SERVICE_TYPE"])
  type      = "String"
  value     = "web"
  overwrite = true

  tags = var.tags
}

resource "aws_ssm_parameter" "target_group_arn" {
  name      = join("", [lower("/smoke/${var.tags.Name}/"), "TARGET_GROUP_ARN"])
  type      = "String"
  value     = aws_alb_target_group.tg.arn
  overwrite = true

  tags = var.tags
}
