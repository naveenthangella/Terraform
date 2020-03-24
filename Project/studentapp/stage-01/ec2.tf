variable "ami_id" {
  default = "ami-0777ff5c030fe1d38"
}
resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = "t2.micro"
}