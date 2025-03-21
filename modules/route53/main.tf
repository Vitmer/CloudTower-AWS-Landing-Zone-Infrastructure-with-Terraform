resource "aws_route53_zone" "main" {
  name = var.domain
}

resource "aws_route53_record" "app" {
  zone_id = aws_route53_zone.main.zone_id  # <-- Заменили var.zone_id на aws_route53_zone.main.zone_id
  name    = "app.${var.domain}"
  type    = "A"

  alias {
  name                   = var.alb_dns
  zone_id                = var.alb_zone_id  # ← правильно
  evaluate_target_health = true
  }
}