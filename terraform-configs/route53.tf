resource "aws_route53_record" "erpnext_dns" {
  zone_id = "ZONE_ID"
  name    = "erp.yourdomain.com"
  type    = "A"

  alias {
    name                   = aws_lb.erpnext_alb.dns_name
    zone_id                = aws_lb.erpnext_alb.zone_id
    evaluate_target_health = true
  }
}