output "ALLOW_SSH_INTERNAL_SG" {
  value = aws_security_group.allow-ssh-internal.id
}

output "ALLOW_MARIADB_INTERNAL_SG" {
  value = aws_security_group.allow-mariadb-internal.id
}