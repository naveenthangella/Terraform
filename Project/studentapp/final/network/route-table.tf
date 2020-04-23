resource "aws_route_table" "public-route-student-vpc" {
  vpc_id                    = aws_vpc.main.id
  tags                      = {
    Name                    = "studentapp-vpc-rt-pubic"
  }
}

resource "aws_route_table" "private-route-student-vpc" {
  vpc_id                    = aws_vpc.main.id
  tags                      = {
    Name                    = "studentapp-vpc-rt-private"
  }
}

resource "aws_route" "public-route-to-default" {
  route_table_id            = aws_route_table.public-route-student-vpc.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main-to-studentapp.id
}

resource "aws_route" "private-route-to-default" {
  route_table_id            = aws_route_table.private-route-student-vpc.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main-to-studentapp.id
}

resource "aws_route" "route-to-student-vpc" {
  route_table_id            = data.aws_vpc.default.main_route_table_id
  destination_cidr_block    = var.VPC_CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.main-to-studentapp.id
}

resource "aws_route" "igw-route" {
  route_table_id            = aws_route_table.public-route-student-vpc.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.gw.id
}

resource "aws_route" "ngw-route" {
  route_table_id            = aws_route_table.private-route-student-vpc.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.gw.id
}
