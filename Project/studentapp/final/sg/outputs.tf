output "ALLOW_INTERNAL_SG" {
  value = aws_security_group.allow-ssh-internal.id
}

output "ALLOW_MARIADB_INTERNAL_SG" {
  value = aws_security_group.allow-mariadb-internal.id
}

output "ALLOW_WEB_PUBLIC" {
  value = aws_security_group.allow-web-public.id
}
output "ALLOW_WEB_INTERNAL" {
  value = aws_security_group.allow-web-internal.id
}