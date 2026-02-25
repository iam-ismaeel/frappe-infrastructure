resource "aws_lb" "erpnext_alb" {
  name               = "erpnext-alb"
  load_balancer_type = "application"
  subnets            = ["subnet-xxxx", "subnet-yyyy"]
}