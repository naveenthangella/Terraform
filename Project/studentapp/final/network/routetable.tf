resource "aws_route_table" "PUBLIC-student-workstation" {
  vpc_id                    = aws_vpc.main.id
  tags                      = {
    Name                    = "Studnet VPC to Workstation default"
  }
}
resource "aws_route_table" "PRIVATE-student-workstation" {
  vpc_id                    = aws_vpc.main.id
  tags                      = {
    Name                    = "Studnet VPC to Workstation default"
  }
}
resource "aws_route" "PUBLIC-route-to-workstation" {
  route_table_id            = aws_route_table.PUBLIC-student-workstation.id
  destination_cidr_block    = data.aws_vpc.WORKSTATION_VPCID.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.workstation-to-studentapp.id

}
resource "aws_route" "PRIVATE-route-to-workstation" {
  route_table_id            = aws_route_table.PRIVATE-student-workstation.id
  destination_cidr_block    = data.aws_vpc.WORKSTATION_VPCID.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.workstation-to-studentapp.id

}


resource "aws_route" "route-to-student" {
  route_table_id            = data.aws_vpc.WORKSTATION_VPCID.main_route_table_id
  destination_cidr_block    = var.VPC_CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.workstation-to-studentapp.id
}

resource "aws_route" "igw-route" {
  route_table_id            = aws_route_table.student-workstation.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id
}
