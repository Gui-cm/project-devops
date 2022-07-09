## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.75.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.22.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_asg"></a> [asg](#module\_asg) | terraform-aws-modules/autoscaling/aws | n/a |
| <a name="module_ecs"></a> [ecs](#module\_ecs) | terraform-aws-modules/ecs/aws | n/a |
| <a name="module_sg"></a> [sg](#module\_sg) | github.com/terraform-aws-modules/terraform-aws-security-group | v4.3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnet_ids.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | Create the default tags for organizing services with Amazon Web Service | `map` | <pre>{<br>  "Creator": "Terraform",<br>  "Environment": "Production",<br>  "Lifecycle": "Active",<br>  "Name": "Project-DevOps",<br>  "Owner": "Guilherme",<br>  "Service": "Infra"<br>}</pre> | no |

## Outputs

No outputs.
