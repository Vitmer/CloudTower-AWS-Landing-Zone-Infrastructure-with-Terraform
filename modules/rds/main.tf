resource "aws_db_instance" "db" {
  allocated_storage     = 20
  engine               = "postgres"
  instance_class       = var.db_instance_type
  username            = var.db_username
  password            = var.db_password
  db_subnet_group_name = aws_db_subnet_group.default.name
  publicly_accessible  = false

  skip_final_snapshot   = true
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = var.subnets
}

output "db_address" {
  value = aws_db_instance.db.address
}