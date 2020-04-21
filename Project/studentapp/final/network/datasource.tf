data "aws_availability_zones" "available" {}
data "aws_vpc" "WORKSTATION_VPCID" {
  id = var.WORKSTATION_VPCID
}