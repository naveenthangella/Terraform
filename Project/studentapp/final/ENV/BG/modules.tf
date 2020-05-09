module "SERVERS" {
  source              = "../../servers"
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  INSTANCE_TYPE       = var.INSTANCE_TYPE
  PRIVATE_SUBNETS     = data.terraform_remote_state.blue.outputs.PRIVATE_SUBNETS
  ALLOW_INTERNAL_SG   = data.terraform_remote_state.blue.outputs.ALLOW_INTERNAL_SG
  ALLOW_WEB_INTERNAL  =data.terraform_remote_state.blue.outputs.ALLOW_WEB_INTERNAL
  DBHOST              = data.terraform_remote_state.blue.outputs.DBHOST
  INSTANCE_COUNT      = var.INSTANCE_COUNT
  DEPLOYMENT          = "green"

}


module "ALB" {
  source                      = "../../alb"
  ALLOW_WEB_PUBLIC            = data.terraform_remote_state.blue.outputs.ALLOW_WEB_PUBLIC
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  PUBLIC_SUBNETS              = data.terraform_remote_state.blue.outputs.PUBLIC_SUBNETS
  VPCID                       = data.terraform_remote_state.blue.outputs.VPCID
  INSTANCEID                  = module.SERVERS.INSTANCEID
  DEPLOYMENT                  = "green"
}

data "terraform_remote_state" "blue" {
  backend = "s3"
  config  = {
    bucket  = "project-test-infra"
    key     = "project-prod-states"
    region  = "us-west-2"
  }
}

output "ALL" {
  value = "DBHOST = ${data.terraform_remote_state.blue.outputs.DBHOST}"
}


terraform {
  backend "s3" {
    bucket = "project-test-infra"
    key    = "project-prod-states-green"
    region = "us-west-2"
  }
}

data "aws_vpc" "default" {
  id = "vpc-948554ed"
}