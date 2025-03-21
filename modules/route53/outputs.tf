output "zone_id" {
  description = "ID созданной зоны Route 53"
  value       = aws_route53_zone.main.zone_id
}