resource "aws_lb_target_group" "proxy_servers" {
  name     = "${var.global_var_tag_name}-${var.global_var_environment}-Proxy"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.variable_vpc_id
  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-ProxyServers-Main-TargetGroup"
  }
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = aws_lb_target_group.proxy_servers.arn
  target_id = var.variable_alb_proxy_target_group_instance_targets
  port = var.variable_alb_target_group_port
}

resource "aws_lb_target_group" "application" {
  name     = "${var.global_var_tag_name}-${var.global_var_environment}-App-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.variable_vpc_id

  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-InternalALB-App-TargetGroup"
  }
}

# resource "aws_lb_target_group_attachment" "that" {
#   target_group_arn = aws_lb_target_group.application.arn
#   target_id = var.variable_alb_application_target_group_instance_targets
#   port = var.variable_alb_target_group_port
# }
