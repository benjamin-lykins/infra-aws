resource "aws_lb" "test" {
  name               = var.lb_name
  internal           = var.lb_internal
  load_balancer_type = var.lb_type
  security_groups    = var.lb_security_group_ids
  subnets            = var.lb_subnet_ids
}
