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

