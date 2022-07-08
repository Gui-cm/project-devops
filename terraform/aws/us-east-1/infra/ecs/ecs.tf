module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name = lower("cluster-${var.tags.Name}")

  autoscaling_capacity_providers = {
    asg = {
      auto_scaling_group_arn         = module.asg.autoscaling_group_arn
      managed_termination_protection = "DISABLED"

      managed_scaling = {
        maximum_scaling_step_size = 2
        minimum_scaling_step_size = 1
        status                    = "ENABLED"
        target_capacity           = 60
      }

      default_capacity_provider_strategy = {
        weight = 60
        base   = 20
      }
    }
  }

  tags = var.tags
}