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

variable "container_cpu" {
  type    = string
  default = "512"
}

variable "container_memory_reservation" {
  type    = string
  default = "512"
}

variable "container_memory" {
  type    = string
  default = "512"
}

variable "container_port" {
  type    = number
  default = 1337
}

variable "service_desired_count" {
  type    = string
  default = "1"
}

variable "dns" {
  description = "List of DNS"

  default = [
    "cms-frontend-smoke.getninjas.com.br",
  ]
}
