locals {
  AZ_COUNT  = "${length(var.PRIVATE_SUBNETS)-2}"
}