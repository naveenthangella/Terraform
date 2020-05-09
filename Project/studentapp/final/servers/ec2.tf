resource "random_integer" "priority" {
  min     = 0
  max     = local.AZ_COUNT
}

resource "aws_instance" "web" {
  count                   = var.INSTANCE_COUNT
  ami                     = data.aws_ami.ami.image_id
  instance_type           = var.INSTANCE_TYPE
  subnet_id               = element(var.PRIVATE_SUBNETS, random_integer.priority.result)
  vpc_security_group_ids  = [var.ALLOW_INTERNAL_SG,var.ALLOW_WEB_INTERNAL]
  key_name                = "devops"
  tags                    = {
        "Name"            = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-NODE"
        "ENV"             = var.DEFAULT_TAGS["ENV"]
        #"DEPLOYMENT"      = var.DEPLOYMENT
  }

  provisioner "remote-exec" {
    connection {
      host                = self.private_ip
      user                = "root"
      password            = "DevOps321"
    }

    inline = [
      "yum install ansible -y",
      "echo localhost >/tmp/hosts",
      "ansible-pull -i /tmp/hosts -U https://github.com/naveenthangella/Ansible.git Playbooks/webapp.yml -e DBUSER=student -e DBPASS=student1 -e DBNAME=studentapp -e DBHOST=${var.DBHOST}"
    ]
  }

}