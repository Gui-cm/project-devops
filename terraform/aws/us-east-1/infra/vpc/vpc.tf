data "aws_availability_zones" "available_zones" {
  state = "available"
}

resource "aws_vpc" "ecs-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.tags.Name}"
  }
}

resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.ecs-vpc.id
  cidr_block              = cidrsubnet(aws_vpc.ecs-vpc.cidr_block, 8, 2 + count.index)
  availability_zone       = data.aws_availability_zones.available_zones.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-public"
  }
}

resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.ecs-vpc.id
  cidr_block        = cidrsubnet(aws_vpc.ecs-vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  tags = {
    Name = "subnet-private"
  }

}
