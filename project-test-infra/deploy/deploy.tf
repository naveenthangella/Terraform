variable "URL" {}
resource "null_resource" "deploy" {
  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      user = "root"
      password = "DevOps321"
    }

    inline = [
      "ansible-pull -i /tmp/hosts -U  https://github.com/naveenthangella/Ansible.git Playbooks/deploy.yml -e URL=${var.URL}"
    ]
  }
}

