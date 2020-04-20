variable "VPC_CIDR" {}
variable "DEFAULT_TAGS" {
  type = map
}
variable "INSTANCE_TYPE" {}
variable "PRIVATE_SUBNETS" {
  type = list
}