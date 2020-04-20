output "PRIVATE_SUBNETS" {
  value = aws_subnet.subnets.*.id
}