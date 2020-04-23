variable "DEFAULT_TAGS" {
  type = map
}

variable "ALLOW_WEB_PUBLIC" {}
variable "PUBLIC_SUBNETS" {
  type = list
}
variable "VPCID" {}
variable "INSTANCEID" {
  type = list
}
variable "DEPLOYMENT" {}