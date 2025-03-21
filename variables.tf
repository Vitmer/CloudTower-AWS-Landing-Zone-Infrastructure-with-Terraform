variable "aws_region" {
  description = "Регион AWS"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR-блок для VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Список публичных подсетей"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Список приватных подсетей"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "ecs_instance_type" {
  description = "Тип EC2-инстанса для ECS"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_type" {
  description = "Тип инстанса для RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "Имя пользователя базы данных"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Пароль базы данных"
  type        = string
  sensitive   = true
}

variable "s3_bucket_name" {
  description = "Имя S3-бакета"
  type        = string
}

variable "route53_domain" {
  description = "Доменное имя в Route 53"
  type        = string
}

variable "ses_domain" {
  description = "Домен для Amazon SES"
  type        = string
}

variable "sns_topic_name" {
  description = "Имя SNS-топика"
  type        = string
  default     = "alerts-topic"
}