resource "random_integer" "AZ" {

  min = 0
  max = local.AZ_COUNT

}


resource "aws_instance" "web" {
  ami = data.aws_ami.ami.image_id
  instance_type = var.INSTANCE_TYPE
  subnet_id = element(var.PRIVATE_SUBNETS, random_integer.AZ.result )
  tags ={
    "Name" = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-NODE"
  }
}