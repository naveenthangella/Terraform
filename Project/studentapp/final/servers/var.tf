variable "INSTANCE_TYPE" {}
variable "DEFAULT_TAGS" {
  type = map
}
variable "PRIVATE_SUBNETS" {
  type = list
}
variable "ALLOW_INTERNAL_SG" {}