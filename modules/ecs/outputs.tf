output "alb_dns_name" {
  description = "DNS имя Load Balancer'а"
  value       = aws_lb.ecs_alb.dns_name  
}

output "ecs_cluster_name" {
  description = "Имя ECS-кластера"
  value       = aws_ecs_cluster.ecs_cluster.name
}

output "alb_zone_id" {
  description = "Zone ID для ALB, необходимый для Route 53 alias"
  value       = aws_lb.ecs_alb.zone_id
}