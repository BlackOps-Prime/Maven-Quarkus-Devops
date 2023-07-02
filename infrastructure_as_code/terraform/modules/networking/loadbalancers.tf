resource "aws_alb" "external" {
  name                       = "External-App-LoadBalancer"
  internal                   = false
  load_balancer_type         = "application"
  subnets                    = [for subnet in aws_subnet.public : subnet.id]
  enable_deletion_protection = var.variable_external_alb_enable_delete_protection


  tags = {
    Name = "${var.global_var_tag_name}-External-LoadBalancer"
  }
}

resource "aws_alb" "internal" {
  name                       = "Internal-App-LoadBalancer"
  internal                   = true
  load_balancer_type         = "application"
  subnets                    = [for subnet in aws_subnet.private : subnet.id]
  enable_deletion_protection = var.variable_internal_alb_enable_delete_protection
  security_groups            = [aws_security_group.internal_load_balancer.id]


  tags = {
    Name = "${var.global_var_tag_name}-Internal-LoadBalancer"
  }
}