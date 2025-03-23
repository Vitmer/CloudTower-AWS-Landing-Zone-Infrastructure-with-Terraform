resource "aws_db_instance" "db" {
  allocated_storage     = 20
  engine               = "postgres"
  instance_class       = var.db_instance_type
  username            = var.db_username
  password            = var.db_password
  db_subnet_group_name = aws_db_subnet_group.default.name
  publicly_accessible  = false

  skip_final_snapshot   = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  backup_retention_period = 7
  multi_az                = false
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = var.subnets
}

output "db_address" {
  value = aws_db_instance.db.address
}

resource "aws_security_group" "rds_sg" {
  name   = "rds-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # или точечный IP/SG из ECS
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}