output "PRIVATE_SUBNETS" {
  value = module.NETWORK.PRIVATE_SUBNETS
}

output "PUBLIC_SUBNETS" {
  value = module.NETWORK.PUBLIC_SUBNETS
}

output "DBHOST" {
  value = module.RDS.DBHOST
}

output "VPCID" {
  value = module.NETWORK.VPCID
}

output "ALLOW_INTERNAL_SG" {
  value = module.SG.ALLOW_INTERNAL_SG
}

output "ALLOW_MARIADB_INTERNAL_SG" {
  value = module.SG.ALLOW_MARIADB_INTERNAL_SG
}

output "ALLOW_WEB_PUBLIC" {
  value = module.SG.ALLOW_WEB_PUBLIC
}
output "ALLOW_WEB_INTERNAL" {
  value = module.SG.ALLOW_WEB_INTERNAL
}