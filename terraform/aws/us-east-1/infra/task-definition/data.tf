data "aws_vpc" "my_vpc" {
  filter {
    name   = "tag:Name"
    values = ["Project-*"]
  }
}

data "aws_subnet_ids" "prv" {
  vpc_id = data.aws_vpc.my_vpc.id

  tags = {
    Name = "subnet-private"
  }
}

data "aws_subnet_ids" "pub" {
  vpc_id = data.aws_vpc.my_vpc.id

  tags = {
    Name = "subnet-public"
  }
}

data "template_file" "policy" {
  template = file("${path.module}/policies/iam.json")

  vars = {
    resource = "*"
  }
}
