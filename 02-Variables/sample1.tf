variable "simple-string" {
  type = string
  default = "Simple"
}

variable "simple-number" {
  type = number
  default = 100
}

variable "simple-boolean" {
  default = true
}

variable "simple-list" {
  type = list
  default = [111, "abc"]
}

variable "simple-map" {
  type = map
  default = {
    first-name = "Naveen"
    last-name = "Tangela"
  }
}
resource "null_resource" "sample" {
  provisioner "local-exec" {
    command = "echo -e \" String = ${var.simple-string} \n Number = ${var.simple-number} \n list value = ${var.simple-list[1]} \n Name = ${var.simple-map["last-name"]}\""
  }
}