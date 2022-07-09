## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.75.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bucket"></a> [bucket](#module\_bucket) | github.com/terraform-aws-modules/terraform-aws-s3-bucket | v3.0.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | Create the default tags for organizing services with Amazon Web Service | `map` | <pre>{<br>  "Creator": "Terraform",<br>  "Environment": "Production",<br>  "Lifecycle": "Active",<br>  "Name": "Project-DevOps",<br>  "Owner": "Guilherme",<br>  "Service": "Infra"<br>}</pre> | no |

## Outputs

No outputs.
