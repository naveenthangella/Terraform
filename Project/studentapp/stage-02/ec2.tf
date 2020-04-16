
provider "aws" {
  region = "us-west-2"
}
variable "ami_id" {
  default = "ami-0777ff5c030fe1d38"
}
resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0183b01f41709052a","sg-0404201bfe4db9f05","sg-052d4431ac57068ba","sg-0e1737254ce68c0b4"]

  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      user = "root"
      password = "DevOps321"
    }

    inline = [
      "yum install ansible -y",
      "echo localhost >/tmp/hosts",
      "ansible-pull -i /tmp/hosts -U https://github.com/naveenthangella/Ansible.git Playbooks/webapp.yml"
    ]
  }
}