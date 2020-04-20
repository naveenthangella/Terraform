module "NETWORK" {
  source            = "../../network"
  VPC_CIDR          = var.VPC_CIDR
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  WORKSTATION_VPCID   = data.aws_vpc.vpc.WORKSTATION_VPCID
}

module "SERVER" {
  source            = "../../servers"
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  INSTANCE_TYPE     = var.INSTANCE_TYPE
  PRIVATE_SUBNETS   = module.NETWORK.PRIVATE_SUBNETS
  ALLOW_INTERNAL_SG = module.sg.ALLOW_INTERNAL_SG
}

module "sg" {
  source            = "../../sg"
  VPCID             = module.NETWORK.VPCID
  INTERNAL_CIDR     = [var.VPC_CIDR, data.aws_vpc.vpc.cidr_block]
}