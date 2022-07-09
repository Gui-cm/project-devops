module "sg" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group?ref=v4.3.0"

  create = true

  name   = lower("${var.tags.Name}-${var.tags.Service}")
  vpc_id = data.aws_vpc.vpc.id


  ingress_cidr_blocks = ["10.0.0.0/16"]
  ingress_rules       = ["all-all"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "GetNinjas VPN"
      cidr_blocks = "10.0.0.0/16"

    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "DiaZero"
      cidr_blocks = "187.11.115.28/32"

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
