variable "vpc_id" {
  description = "ID основной VPC, для которой будут включены Flow Logs"
  type        = string
}

variable "org_trail_bucket" {
  description = "Имя S3-бакета для централизованного CloudTrail"
  type        = string
  default     = "my-default-cloudtrail-logs"
}