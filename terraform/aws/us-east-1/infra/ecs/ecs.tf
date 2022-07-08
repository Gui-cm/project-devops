module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name = "project-devops"

  autoscaling_capacity_providers = {
    one = {
      auto_scaling_group_arn         = "arn:aws:autoscaling:eu-west-1:012345678901:autoScalingGroup:08419a61:autoScalingGroupName/ecs-ec2-one-20220603194933774300000011"
      managed_termination_protection = "ENABLED"

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

  tags = {
    Environment = "Development"
    Project     = "EcsEc2"
  }
}