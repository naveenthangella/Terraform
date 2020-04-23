module "NETWORK" {
  source              = "../../network"
  VPC_CIDR            = var.VPC_CIDR
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  DEFAULT_VPCID       = data.aws_vpc.default.id
}

module "SERVERS" {
  source              = "../../servers"
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  INSTANCE_TYPE       = var.INSTANCE_TYPE
  PRIVATE_SUBNETS     = module.NETWORK.PRIVATE_SUBNETS
  ALLOW_INTERNAL_SG   = module.SG.ALLOW_INTERNAL_SG
  ALLOW_WEB_INTERNAL  = module.SG.ALLOW_WEB_INTERNAL
  DBHOST              = module.RDS.DBHOST
}

module "SG" {
  source              = "../../sg"
  VPCID               = module.NETWORK.VPCID
  INTERNAL_CIDR       = [var.VPC_CIDR, data.aws_vpc.default.cidr_block]
}

module "RDS" {
  source                      = "../../rds"
  PRIVATE_SUBNETS             = module.NETWORK.PRIVATE_SUBNETS
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  ALLOW_MARIADB_INTERNAL_SG   = module.SG.ALLOW_MARIADB_INTERNAL_SG
}

module "ALB" {
  source                      = "../../alb"
  ALLOW_WEB_PUBLIC            = module.SG.ALLOW_WEB_PUBLIC
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  PUBLIC_SUBNETS              = module.NETWORK.PUBLIC_SUBNETS
  VPCID                       = module.NETWORK.VPCID
  INSTANCEID                  = module.SERVERS.INSTANCEID
}

data "aws_vpc" "default" {
  id = "vpc-948554ed"
}