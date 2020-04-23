data "aws_ami" "ami" {
  owners            = ["self"]
  most_recent       = true
}