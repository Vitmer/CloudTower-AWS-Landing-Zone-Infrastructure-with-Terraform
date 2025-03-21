variable "alb_dns" {
  description = "DNS имя Load Balancer'а"
  type        = string
}

variable "alb_zone_id" {
  description = "Zone ID ALB (для alias записи)"
  type        = string
}

variable "domain" {
  description = "Доменное имя для Route 53"
  type        = string
}