output "PRIVATE_SUBNETS" {
  value = aws_subnet.subnets.*.id
}

output "VPCID" {
  value = aws_vpc.main.id
}
