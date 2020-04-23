resource "aws_subnet" "public-subnets" {
  count                 = length(data.aws_availability_zones.available.names)
  cidr_block            = cidrsubnet(var.VPC_CIDR, 8, count.index)
  vpc_id                = aws_vpc.main.id
  availability_zone     = element(data.aws_availability_zones.available.names, count.index)
  tags                  = {
    "Name"              = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-PUBLIC-SUBNET-${count.index+1}"
  }
}

resource "aws_subnet" "private-subnets" {
  count                 = length(data.aws_availability_zones.available.names)
  cidr_block            = cidrsubnet(var.VPC_CIDR, 8, count.index+4)
  vpc_id                = aws_vpc.main.id
  availability_zone     = element(data.aws_availability_zones.available.names, count.index)
  tags                  = {
    "Name"              = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-PRIVATE-SUBNET-${count.index}"
  }
}

resource "aws_route_table_association" "public-subnets-assoc" {
  count                 = length(data.aws_availability_zones.available.names)
  route_table_id        = aws_route_table.public-route-student-vpc.id
  subnet_id             = element(aws_subnet.public-subnets.*.id, count.index)
}

resource "aws_route_table_association" "private-subnets-assoc" {
  count                 = length(data.aws_availability_zones.available.names)
  route_table_id        = aws_route_table.private-route-student-vpc.id
  subnet_id             = element(aws_subnet.private-subnets.*.id, count.index)
}