locals {
  DB_RES_NAME         = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-rds"
}


resource "aws_db_instance" "rds-instance" {
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mariadb"
  engine_version          = "10.4.8"
  instance_class          = "db.t2.micro"
  name                    = "studentapp"
  username                = "student"
  password                = "student1"
  vpc_security_group_ids  = [var.ALLOW_MARIADB_INTERNAL_SG]
  identifier              = lower(local.DB_RES_NAME)
  parameter_group_name    = aws_db_parameter_group.rds-parameter-group.name
  option_group_name       = aws_db_option_group.rds-option-group.name
  db_subnet_group_name    = aws_db_subnet_group.rds-subnet-group.name
  final_snapshot_identifier = "backup"
  tags                    = {
    Name                  = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-RDS"
  }
}

resource "null_resource" "schema-setup" {
  provisioner "local-exec" {
    command = <<EOF
      curl -s https://studentapi-cit.s3-us-west-2.amazonaws.com/student-rds.sql -o /tmp/schema.sql
      mysql -h ${aws_db_instance.rds-instance.address} -ustudent -pstudent1 < /tmp/schema.sql
    EOF
  }
}
