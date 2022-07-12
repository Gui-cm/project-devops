## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.75.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecs"></a> [ecs](#module\_ecs) | terraform-aws-modules/ecs/aws | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | Create the default tags for organizing services with Amazon Web Service | `map` | <pre>{<br>  "Creator": "Terraform",<br>  "Environment": "Production",<br>  "Lifecycle": "Active",<br>  "Name": "Project-DevOps",<br>  "Owner": "Guilherme",<br>  "Service": "Infra"<br>}</pre> | no |

## Outputs

No outputs.
