resource "aws_security_group" "allow-ssh-internal" {
  name = "allow-ssh-internal"
  description = "allow mariadb internal access"
  vpc_id = var.VPCID

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.INTERNAL_CIDR
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

}
resource "aws_security_group" "allow-mariadb-internal" {
  name        = "allow-mariadb-internal"
  description = "allow mariadb internal access"
  vpc_id      = var.VPCID

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = var.INTERNAL_CIDR
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

}
