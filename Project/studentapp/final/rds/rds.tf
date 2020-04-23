locals {
  DB_RES_NAME                   = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-rds"
}


resource "aws_db_instance" "rds-instance" {
  allocated_storage             = 20
  storage_type                  = "gp2"
  engine                        = "mariadb"
  engine_version                = "10.3.13"
  instance_class                = "db.t2.micro"
  name                          = "studentapp"
  username                      = "student"
  password                      = "student1"
  parameter_group_name          = aws_db_parameter_group.mariadb.name
  db_subnet_group_name          = aws_db_subnet_group.rds-subnet-group.name
  option_group_name             = aws_db_option_group.mariadb.name
  identifier                    = lower(local.DB_RES_NAME)
  final_snapshot_identifier     = "backup"
  vpc_security_group_ids        = [var.ALLOW_MARIADB_INTERNAL_SG]

  tags                          = {
    Name                        = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-RDS"
  }
}

resource "null_resource" "schema-setup" {
  // Pre-req for this is , We need to have mysql client installed.
  provisioner "local-exec" {
    command = <<EOF
      curl -s https://studentapi-cit.s3-us-west-2.amazonaws.com/student-rds.sql -o /tmp/schema.sql
      mysql -h ${aws_db_instance.rds-instance.address} -ustudent -pstudent1 < /tmp/schema.sql
EOF
  }
}