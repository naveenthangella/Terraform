variable "simple-string" {
  type = string
  default = "Simple"
}

resource "null_resource" "sample" {
  provisioner "local-exec" {
    command = "echo -e ${var.simple-string}"
  }
}