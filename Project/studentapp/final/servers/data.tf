data "aws_ami" "ami" {
  owners            = ["973714476881"]
  name_regex       = "^Centos"
}