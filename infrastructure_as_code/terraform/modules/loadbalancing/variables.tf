variable "variable_alb_proxy_target_group_instance_targets" {
  description = "Default instance ids of proxy servers"
}

variable "variable_public_subnets_security_group" {
  description = "Default public subnets security group"
}

variable "variable_public_subnets" {
  description = "Default list of public subnets"
}

variable "global_var_tag_name" {
  type        = string
  description = "Default Name Prefix of Resource"
}

variable "global_var_environment" {}

variable "variable_external_alb_enable_delete_protection" {
  type        = bool
  default     = false
  description = "Default delete protection rule for External Load Balancer"
}

variable "variable_private_subnets" {
  description = "Default list of public subnets"
}

variable "variable_internal_alb_enable_delete_protection" {
  type        = bool
  default     = false
  description = "Default delete protection rule for External Load Balancer"
}

variable "variable_internal_loadbalancer_security_group" {
  description = "Default security group ID for internal loadbalancer"
}


variable "variable_vpc_id" {
  description = "Main VPC ID"
}

variable "variable_alb_target_group_port" {
  type = number
  default = 80
  description = "Default proxy instance target group port"
}