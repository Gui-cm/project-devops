variable "tags" {
  description = "Create the default tags for organizing services with Amazon Web Service"

  default = {
    Name        = "Project-DevOps"
    Service     = "Infra"
    Lifecycle   = "Active"
    Owner       = "Guilherme"
    Environment = "Production"
    Creator     = "Terraform"
  }
}