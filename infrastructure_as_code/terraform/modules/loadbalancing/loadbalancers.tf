resource "aws_alb" "external" {
  name                       = "${var.global_var_tag_name}-${var.global_var_environment}-Ext-LB"
  internal                   = false
  load_balancer_type         = "application"
  # subnets                    = [for subnet in aws_subnet.public : subnet.id]
  subnets = var.variable_public_subnets
  enable_deletion_protection = var.variable_external_alb_enable_delete_protection
  security_groups = var.variable_public_subnets_security_group


  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-External-LoadBalancer"
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_alb.external.arn
  port              = "80"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.proxy_servers.arn

  }

  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-External-LoadBalancer-HTTPS-Listener"
  }
}

resource "aws_alb" "internal" {
  name                       = "${var.global_var_tag_name}-${var.global_var_environment}-Int-LB"
  internal                   = true
  load_balancer_type         = "application"
  subnets = var.variable_private_subnets
  # subnets                    = [for subnet in aws_subnet.private : subnet.id]
  enable_deletion_protection = var.variable_internal_alb_enable_delete_protection
  # security_groups            = [aws_security_group.internal_load_balancer.id]
  security_groups = var.variable_internal_loadbalancer_security_group


  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-Internal-LoadBalancer"
  }
}


resource "aws_lb_listener" "internal" {
  load_balancer_arn = aws_alb.internal.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application.arn

  }

  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-App-HTTP-Listener"
  }
}