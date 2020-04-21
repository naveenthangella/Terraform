resource "aws_vpc" "main" {
  cidr_block    = var.VPC_CIDR
  tags          ={
    Name        = "${var.DEFAULT_TAGS["PROJECT_NAME"] }-${var.DEFAULT_TAGS["ENV"]}-VPC"
    Created_By  = "Terraform"
  }
}

resource "aws_vpc_peering_connection" "workstation-to-studentapp" {
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = var.WORKSTATION_VPCID
  auto_accept   = true
  tags          = {
    Name        = "VPC peering between ${var.DEFAULT_TAGS["ENV"]} and WORKSTATION(Bastion node)"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id        = aws_vpc.main.id
  tags          = {
    Name        = "student vpc igw"
  }
}

resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.PUBLIC-subnets.0.id
}

