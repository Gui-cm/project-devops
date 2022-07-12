module "sg" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group?ref=v4.3.0"

  create = true

  name   = lower("alb-project-devops")
  vpc_id = data.aws_vpc.my_vpc.id


  ingress_cidr_blocks = ["10.0.0.0/16"]
  ingress_rules       = ["all-all"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "My IP"
      cidr_blocks = "200.150.176.192/32"

    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "Acess Public"
      cidr_blocks = "0.0.0.0/0"

    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Acess Public"
      cidr_blocks = "0.0.0.0/0"

    },
  ]

  egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = var.tags
}
