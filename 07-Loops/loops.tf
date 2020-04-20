resource "null_resource" "loops" {
  count = 2
  provisioner "local-exec" {
    command = "echo ${cidrsubnet("10.100.0.0/16",3,count.index)}"
  }
}