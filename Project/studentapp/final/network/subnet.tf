resource "aws_subnet" "PRIVATE-subnets" {
  count                 = length(data.aws_availability_zones.available.names)
  cidr_block            = cidrsubnet(var.VPC_CIDR, 8, count.index)
  vpc_id                = aws_vpc.main.id
  availability_zone     = element(data.aws_availability_zones.available.names, count.index )
  tags                  = {
    "Name"              = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-PRIVATE-SUBNET-${count.index+1}"
  }
}

resource "aws_subnet" "PUBLIC-subnets" {
  count                 = length(data.aws_availability_zones.available.names)
  cidr_block            = cidrsubnet(var.VPC_CIDR, 8, count.index+4)
  vpc_id                = aws_vpc.main.id
  availability_zone     = element(data.aws_availability_zones.available.names, count.index )
  tags                  = {
    "Name"              = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-PUBLIC-SUBNET-${count.index+1}"
  }
}
resource "aws_route_table_association" "subnet-association" {
  count                 = length(data.aws_availability_zones.available.names)
  route_table_id        = aws_route_table.PRIVATE-student-workstation.id
  subnet_id             = element(aws_subnet.PRIVATE-subnets.*.id, count.index)
}