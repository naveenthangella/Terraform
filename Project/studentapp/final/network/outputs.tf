output "PRIVATE_SUBNETS" {
  value = aws_subnet.private-subnets.*.id
}

output "PUBLIC_SUBNETS" {
  value = aws_subnet.public-subnets.*.id
}

output "VPCID" {
  value = aws_vpc.main.id
}