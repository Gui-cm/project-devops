module "dynamodb_table" {
  source = "terraform-aws-modules/dynamodb-table/aws"

  name     = ower(replace(join("", ["${var.tags.Name}", "${var.tags.Service}"]), "-", "_"))
  hash_key = "id"

  attributes = [
    {
      name = "id"
      type = "N"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}
