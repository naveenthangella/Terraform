resource "aws_security_group" "allow-ssh-internal" {
  name        = "allow-ssh-internal"
  vpc_id      = var.VPCID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.INTERNAL_CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

#  tags = {
#    Name = "allow_tls"
#  }
}
