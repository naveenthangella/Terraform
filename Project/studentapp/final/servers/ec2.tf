resource "random_integer" "AZ" {

  min = 0
  max = local.AZ_COUNT

}


resource "aws_instance" "web" {
  ami                    = data.aws_ami.ami.image_id
  instance_type          = var.INSTANCE_TYPE
  vpc_security_group_ids = [var.ALLOW_SSH_INTERNAL_SG]
  subnet_id              = element(var.PRIVATE_SUBNETS, random_integer.AZ.result )
  tags                   = {
    "Name"               = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-NODE"
  }

  provisioner "remote-exec" {
    connection {
      host                = self.private_ip
      user                = "root"
      password            = "DevOps321"
    }
  }


}
