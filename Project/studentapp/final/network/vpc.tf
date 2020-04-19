resource "aws_vpc" "main" {
  cidr_block = var.VPC_CIDR
  tags {
    Name = "${var.DEFAULT_TAGS["PROJECT_NAME"] }-${var.DEFAULT_TAGS["ENV"]}-VPC"
  }
}