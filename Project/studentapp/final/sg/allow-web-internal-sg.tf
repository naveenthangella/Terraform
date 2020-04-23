resource "aws_security_group" "allow-web-internal" {
  name        = "allow-web-internal"
  description = "Allow WEB Internal Access"
  vpc_id      = var.VPCID

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.INTERNAL_CIDR
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

