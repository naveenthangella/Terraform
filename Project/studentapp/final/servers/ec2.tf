resource "aws_instance" "web" {
  ami = data.aws_ami.ami.image_id
  instance_type = var.INSTANCE_TYPE
  tags ={
    "Name" = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-NODE"
  }
}