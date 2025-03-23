variable "vpc_id" {
  description = "ID VPC, в которой будет RDS"
  type        = string
}

variable "subnets" {
  description = "Список приватных подсетей для RDS"
  type        = list(string)
}

variable "db_username" {
  description = "Имя пользователя для базы данных"
  type        = string
}

variable "db_password" {
  description = "Пароль для базы данных"
  type        = string
}

variable "db_instance_type" {
  description = "Тип инстанса для базы данных"
  type        = string
}
