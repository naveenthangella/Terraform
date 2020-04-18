module "add" {
  source = "./add"
  a = var.a
  b = var.b
}

variable "a" {}
variable "b" {}

output "addition" {
  value = module.add.add
}