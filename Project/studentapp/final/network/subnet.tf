resource "aws_subnet" "subnets" {
  count                 = length(data.aws_availability_zones.available.names)
  cidr_block            = cidrsubnet(var.VPC_CIDR, 3, count.index)
  vpc_id                = aws_vpc.main.id
  availability_zone     = element(data.aws_availability_zones.available.names, count.index )
  tags                  = {
    "Name"              = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-${count.index+1}"
  }
}
resource "aws_route_table_association" "subnet-association" {
  count                 = length(data.aws_availability_zones.available.names)
  route_table_id        = aws_route_table.student-workstation.id
  subnet_id             = element(aws_subnet.subnets.*.id, count.index )
}