resource "aws_lb_target_group" "erpnext_tg" {
  port     = 8080
  protocol = "HTTP"
  vpc_id   = "vpc-xxxx"
}

resource "aws_lb_target_group_attachment" "erpnext" {
  target_group_arn = aws_lb_target_group.erpnext.arn
  target_id        = aws_instance.erpnext.id
  port             = 8080
}