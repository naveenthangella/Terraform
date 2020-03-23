variable "simple-string" {
  type = string
  default = "Simple"
}

variable "simple-number" {
  type = number
  default = 100
}

resource "null_resource" "sample" {
  provisioner "local-exec" {
    command = "echo -e \"String = ${var.simple-string} \n Number = ${var.simple-number}\""
  }
}