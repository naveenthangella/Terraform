
data "aws_availability_zones" "available" {
  state = "avaiable"
}

output "zones" {
  value = data.aws_availability_zones.available.names
}