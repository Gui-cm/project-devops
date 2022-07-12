data "aws_vpc" "my_vpc" {
  filter {
    name   = "tag:Name"
    values = ["Project-*"]
  }
}

data "aws_subnet_ids" "prv" {
  vpc_id = data.aws_vpc.my_vpc.id

  filter {
    name   = "tag:Name"
    values = ["subnet-private"]
  }
}

data "aws_subnet_ids" "pub" {
  vpc_id = data.aws_vpc.my_vpc.id

  filter {
    name   = "tag:Name"
    values = ["subnet-public"]
  }
}

output "aws_subnet_ids_prv" {
  value = data.aws_subnet_ids.prv.ids
}

output "aws_subnet_ids_pub" {
  value = data.aws_subnet_ids.pub.ids
}
