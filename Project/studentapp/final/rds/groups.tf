locals {
  SG_RES_NAME       = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-SUBNET-GROUP"
  OG_RES_NAME       = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-OPTION-GROUP"
  PG_RES_NAME       = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-PARAMETER-GROUP"
}

resource "aws_db_subnet_group" "rds-subnet-group" {
  name              = lower(local.SG_RES_NAME)
  subnet_ids        = var.PRIVATE_SUBNETS
  tags              = {
    Name            = upper(local.SG_RES_NAME)
  }
}

resource "aws_db_option_group" "rds-option-group" {
  name                  = lower(local.OG_RES_NAME)
  engine_name           = "mariadb"
  major_engine_version  = "10.3"
  tags                  = {
    Name                = upper(local.OG_RES_NAME)
  }

}

resource "aws_db_parameter_group" "rds-parameter-group" {
  name                  = lower(local.PG_RES_NAME)
  family                = "mariadb10.3"
  tags                  = {
    Name                = upper(local.PG_RES_NAME)
  }
}