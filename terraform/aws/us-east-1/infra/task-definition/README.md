## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.75.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.22.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm_request_certificate"></a> [acm\_request\_certificate](#module\_acm\_request\_certificate) | cloudposse/acm-request-certificate/aws | n/a |
| <a name="module_alb"></a> [alb](#module\_alb) | terraform-aws-modules/alb/aws | ~> 6.0 |
| <a name="module_policy"></a> [policy](#module\_policy) | github.com/terraform-aws-modules/terraform-aws-iam//modules/iam-policy | v4.2.0 |
| <a name="module_role"></a> [role](#module\_role) | github.com/terraform-aws-modules/terraform-aws-iam//modules/iam-assumable-role | v4.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_alb_listener_rule.alb_listerner_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener_rule) | resource |
| [aws_alb_target_group.tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_ecs_service.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.project_devops](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_ssm_parameter.container_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.container_memory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.container_memory_reservation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.container_port](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.service_type](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.target_group_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.external_alb_listener_arn_ninja](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_vpc.project_devops](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [template_file.iam_policy](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.service_template](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_cpu"></a> [container\_cpu](#input\_container\_cpu) | n/a | `string` | `"512"` | no |
| <a name="input_container_memory"></a> [container\_memory](#input\_container\_memory) | n/a | `string` | `"512"` | no |
| <a name="input_container_memory_reservation"></a> [container\_memory\_reservation](#input\_container\_memory\_reservation) | n/a | `string` | `"512"` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | n/a | `number` | `1337` | no |
| <a name="input_dns"></a> [dns](#input\_dns) | List of DNS | `list` | <pre>[<br>  "cms-frontend-smoke.getninjas.com.br"<br>]</pre> | no |
| <a name="input_service_desired_count"></a> [service\_desired\_count](#input\_service\_desired\_count) | n/a | `string` | `"1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Create the default tags for organizing services with Amazon Web Service | `map` | <pre>{<br>  "Creator": "Terraform",<br>  "Environment": "Production",<br>  "Lifecycle": "Active",<br>  "Name": "Project-DevOps",<br>  "Owner": "Guilherme",<br>  "Service": "Infra"<br>}</pre> | no |

## Outputs

No outputs.
