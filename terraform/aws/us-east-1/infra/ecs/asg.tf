module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = lower("asg-${var.tags.Name}")

  min_size                  = 0
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = ["subnet-077c66685ddf21759"]

  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      checkpoint_delay       = 600
      checkpoint_percentages = [35, 70, 100]
      instance_warmup        = 300
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }

  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  ebs_optimized = true

  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = [module.sg.security_group_id]
    },
  ]

  placement = {
    availability_zone = "us-east-1a"
  }

  tags = var.tags
}
