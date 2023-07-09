# Allow Traffic From External LoadBalancer To Public Subnet
resource "aws_security_group" "public" {
  name        = "Proxy-security-group"
  description = "Proxy Security Group"
  vpc_id      = aws_vpc.this.id

  ingress = [
    {
      description      = "Allow traffic from External LoadBalancer into Public Subnet"
      from_port        = var.variable_proxy_security_group_ingress_from_port
      to_port          = var.variable_proxy_security_group_ingress_to_port
      protocol         = var.variable_proxy_security_group_ingress_protocol
      cidr_blocks      = [var.variable_proxy_security_group_ingress_cidr_block]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = true
    },
    {
      description      = "Allow SSH into Public Subnet"
      from_port        = var.variable_proxy_security_group_ingress_ssh_from_port
      to_port          = var.variable_proxy_security_group_ingress_ssh_to_port
      protocol         = var.variable_proxy_security_group_ssh_ingress_protocol
      cidr_blocks      = [var.variable_proxy_security_group_ssh_ingress_cidr_block]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = true
    }
  ]

  egress {
    from_port = var.variable_proxy_security_group_egress_from_port
    to_port   = var.variable_proxy_security_group_egress_to_port
    protocol  = var.variable_proxy_security_group_egress_protocol
    self      = "true"
  }

  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-Proxy-security-group"
  }
}

# Allow Traffic From Public Subnet Proxies to Internal LoadBalancers
resource "aws_security_group" "internal_load_balancer" {
  name        = "InternalALB-security-group"
  description = "InternalALB Security Group"
  vpc_id      = aws_vpc.this.id

  ingress = [
    {
      description      = "Allow traffic from Public Subnet to InternalALB"
      from_port        = var.variable_alb_security_group_ingress_from_port
      to_port          = var.variable_alb_security_group_ingress_to_port
      protocol         = var.variable_alb_security_group_ingress_protocol
      security_groups  = [aws_security_group.public.id]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      cidr_blocks      = []
      self             = true
    }
  ]

  egress {
    from_port = var.variable_alb_security_group_egress_from_port
    to_port   = var.variable_alb_security_group_egress_to_port
    protocol  = var.variable_alb_security_group_egress_protocol
    self      = "true"
  }

  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-InternalALB-security-group"
  }
}

# Allow Traffic From Internal LoadBalancer Security Group To Application
resource "aws_security_group" "application" {
  name        = "Application-security-group"
  description = "Application Security Group"
  vpc_id      = aws_vpc.this.id

  ingress = [
    {
      description      = "Allow traffic from internal loadbalancer"
      from_port        = var.variable_app_security_group_ingress_from_port
      to_port          = var.variable_app_security_group_ingress_to_port
      protocol         = var.variable_app_security_group_ingress_protocol
      security_groups  = [aws_security_group.internal_load_balancer.id]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      cidr_blocks      = []
      self             = true
    }
  ]

  egress {
    from_port = var.variable_app_security_group_egress_from_port
    to_port   = var.variable_app_security_group_egress_to_port
    protocol  = var.variable_app_security_group_egress_protocol
    self      = "true"
  }

  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-application-security-group"
  }

}


# Allow Traffic From Application Security Group To Database
resource "aws_security_group" "database_allow" {
  name        = "Database-security-group"
  description = "DB Security Group"
  vpc_id      = aws_vpc.this.id
  depends_on  = [aws_security_group.application]

  ingress = [
    {
      description      = "Allow Application Traffic To Database"
      from_port        = var.variable_db_security_group_ingress_to_port
      to_port          = var.variable_db_security_group_ingress_from_port
      protocol         = var.variable_db_security_group_ingress_protocol
      security_groups  = [aws_security_group.application.id]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      cidr_blocks      = []
      self             = true
    }
  ]

  egress {
    from_port = var.variable_db_security_group_egress_from_port
    to_port   = var.variable_db_security_group_egress_to_port
    protocol  = var.variable_db_security_group_egress_protocol
    self      = "true"
  }

  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-database-security-group"
  }

}