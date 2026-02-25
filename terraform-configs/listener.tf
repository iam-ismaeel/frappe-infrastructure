resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.erpnext_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "ACM_CERT_ARN"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.erpnext_tg.arn
  }
}