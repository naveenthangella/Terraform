resource "null_resource" "sample" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}