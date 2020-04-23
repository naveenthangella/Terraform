resource "aws_security_group" "allow-web-public" {
  name        = "allow-web-public"
  description = "Allow WEB Public Access"
  vpc_id      = var.VPCID

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

