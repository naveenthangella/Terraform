data "aws_availability_zones" "available" {}
data "aws_vpc" "default" {
  id = var.DEFAULT_VPCID
}