resource "aws_vpc" "main" {
  cidr_block        = var.VPC_CIDR
  tags              = {
      Name          = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-VPC"
      Created_By    = "Terraform"
  }
}

resource "aws_vpc_peering_connection" "main-to-studentapp" {
  peer_vpc_id       = aws_vpc.main.id
  vpc_id            = var.DEFAULT_VPCID
  auto_accept       = true

  tags              = {
    Name            = "VPC Peering between DEFAULT and STUDENTAPP VPC"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id            = aws_vpc.main.id

  tags              = {
    Name            = "studentapp-vpc-igw"
  }
}

resource "aws_eip" "ngw" {
  vpc      = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.ngw.id
  subnet_id     = aws_subnet.public-subnets.0.id
}