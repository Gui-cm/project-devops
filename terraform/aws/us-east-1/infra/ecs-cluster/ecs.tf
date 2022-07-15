module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name = lower("cluster-${var.tags.Name}")

  cluster_configuration = {
    execute_command_configuration = {
      logging = "OVERRIDE"
      log_configuration = {
        cloud_watch_log_group_name = "/aws/ecs/aws-ec2"
      }
    }
  }

  tags = var.tags
}
