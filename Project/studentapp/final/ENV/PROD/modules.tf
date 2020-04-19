module "NETWORK" {
  source = "../../network"
  VPC_CIDR = var.VPC_CIDR
  DEFAULT_TAGS = var.DEFAULT_TAGS
}