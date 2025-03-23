variable "vpc_id" {
  description = "ID VPC, в которой будет ECS"
  type        = string
}

variable "subnets" {
  description = "Список подсетей для ECS"
  type        = list(string)
}

variable "db_address" {
  description = "Адрес базы данных RDS"
  type        = string
}

variable "bucket_name" {
  description = "Имя S3-бакета"
  type        = string
}

variable "ecs_instance_type" {
  description = "Тип инстанса для ECS"
  type        = string
}

variable "aws_region" {
  description = "Регион AWS"
  type        = string
}

variable "execution_role_arn" {
  type        = string
  description = "IAM Execution Role ARN"
}