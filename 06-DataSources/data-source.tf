
data "aws_availability_zones" "available" {

  state = "avaiable"

}

output "available" {
  value = data.aws_availability_zones.available.names
}