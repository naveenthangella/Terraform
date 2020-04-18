resource "null_resource" "print" {
  provisioner "local-exec" {
    command = "echo ${var.input}"
  }
}

variable "input" {}
