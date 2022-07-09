
data "template_file" "service_template" {
  template = file("${path.module}/service-template-task/service2.json")

  vars = {
    app-name      = lower(var.tags.Name)
    containerPort = var.container_port
    env           = lower(var.tags.Service)
    cpu           = tonumber(var.container_cpu)
    mem           = tonumber(var.container_memory)
    memRes        = tonumber(var.container_memory_reservation)
  }
}

data "aws_vpc" "project_devops" {
  filter {
    name   = "tag:Name"
    values = ["Project-DevOps"]
  }
}

data "aws_ssm_parameter" "external_alb_listener_arn_ninja" {
  name = join("", [lower("/ninja/smoke/"), "ALB_LISTENER_PUBLIC"])
}

data "template_file" "iam_policy" {
  template = file("${path.module}/policies/iam.json")

  vars = {
    bucket = "arn:aws:s3:::project-devops-frontend-gcm"
  }
}

data "aws_vpc" "vpc" {

  filter {
    name   = "tag:Name"
    values = ["Project*"]
  }
}
