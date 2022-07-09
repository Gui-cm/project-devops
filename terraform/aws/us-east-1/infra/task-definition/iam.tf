module "policy" {
  source = "github.com/terraform-aws-modules/terraform-aws-iam//modules/iam-policy?ref=v4.2.0"

  description = "Policy to project ${var.tags.Name}"
  name        = lower("${var.tags.Name}-${var.tags.Service}")
  path        = "/"
  policy      = data.template_file.iam_policy.rendered
}

module "role" {
  source = "github.com/terraform-aws-modules/terraform-aws-iam//modules/iam-assumable-role?ref=v4.2.0"

  create_role             = true
  role_requires_mfa       = false
  role_name               = lower("${var.tags.Name}-${var.tags.Service}")
  custom_role_policy_arns = [module.policy.arn]
  trusted_role_services   = ["ec2.amazonaws.com", "ecs-tasks.amazonaws.com", "ecs.amazonaws.com"]

  tags = var.tags
}
