locals {
  account_common_vars = read_terragrunt_config(find_in_parent_folders("account-common.hcl", "${get_terragrunt_dir()}/account-common.hcl"))
  region_vars         = read_terragrunt_config(find_in_parent_folders("region-common.hcl", "${get_terragrunt_dir()}/region-common.hcl"))

  aws_profile = local.account_common_vars.locals.aws_profile
  aws_region  = local.region_vars.locals.aws_region
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"
  version = ">= 3.75.0"
   profile = "${local.aws_profile}"
}
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    encrypt = true
    bucket  = "terraform-state-gcm"
    region  = "us-east-1"
    key     = "${local.aws_profile}/${path_relative_to_include()}/terraform.tfstate"
    profile = "${local.aws_profile}"
  }
}
