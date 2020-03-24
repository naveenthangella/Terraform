
provider "aws" {
  region = "us-west-2"
}
variable "ami_id" {
  default = "ami-0777ff5c030fe1d38"
}
resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0183b01f41709052a"]
}