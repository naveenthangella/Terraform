module "NETWORK" {
  source            = "../../network"
  VPC_CIDR          = var.VPC_CIDR
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  WORKSTATION_VPCID   = data.aws_vpc.WORKSTATION_VPCID.id
}

module "SERVER" {
  source                = "../../servers"
  DEFAULT_TAGS          = var.DEFAULT_TAGS
  INSTANCE_TYPE         = var.INSTANCE_TYPE
  PRIVATE_SUBNETS       = module.NETWORK.PRIVATE_SUBNETS
  ALLOW_SSH_INTERNAL_SG = module.sg.ALLOW_SSH_INTERNAL_SG
}

module "sg" {
  source            = "../../sg"
  VPCID             = module.NETWORK.VPCID
  INTERNAL_CIDR     = [var.VPC_CIDR, data.aws_vpc.WORKSTATION_VPCID.cidr_block]
}

module "rds" {
  source                    = "../../rds"
  PRIVATE_SUBNETS           = module.NETWORK.PRIVATE_SUBNETS
  DEFAULT_TAGS              = var.DEFAULT_TAGS
  ALLOW_MARIADB_INTERNAL_SG = module.sg.ALLOW_MARIADB_INTERNAL_SG

}