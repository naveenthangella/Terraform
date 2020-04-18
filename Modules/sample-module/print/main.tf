resource "null_resource" "print" {
  provisioner "local-exec" {
    command = "echo ${var.input}"
  }
}

variable "input" {}

output "value entered" {
  value = var.input
}