output "PRIVATE_SUBNETS" {
  value = aws_subnet.PRIVATE-subnets.*.id
}
output "PUBLIC_SUBNETS" {
  value = aws_subnet.PRIVATE-subnets.*.id
}

output "VPCID" {
  value = aws_vpc.main.id
}
