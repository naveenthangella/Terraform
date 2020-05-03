terraform {
  backend "s3" {
    bucket  = "project-test-infra"
    key     = "test-states"
    region  = "us-west-2"
  }
}
provider "aws" {
  region    = "us-west-2"
}
resource "aws_instance" "test" {
  ami           = "ami-0777ff5c030fe1d38"
  instance_type = "t2.small"
  key_name      = "devops"
  vpc_security_group_ids = ["sg-0183b01f41709052a","sg-0404201bfe4db9f05","sg-052d4431ac57068ba"]

  provisioner "remote-exec" {
    connection {
      host      = self.public_ip
      user      = "root"
      password  = "DevOps321"
    }

    inline = [
      "yum install ansible -y",
      "echo localhost > /tmp/hosts",
      "ansible-pull -i /tmp/hosts -U https://github.com/naveenthangella/Ansible.git Playbooks/webapp.yml"
    ]
  }
}