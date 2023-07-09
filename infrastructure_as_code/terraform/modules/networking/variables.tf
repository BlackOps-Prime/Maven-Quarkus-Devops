###### GLOBALS #######
variable "global_var_tag_name" {
  type        = string
  description = "Default Name Prefix of Resource"
}

variable "global_var_environment" {}
##### END GLOBALS ######


#### NETWORKING MODULE VARIABLES ######
variable "variable_vpc_cidr_block_prefixes" {
  type        = map(string)
  description = "Default CIDR block for VPC"
  default = {
    development = "172.10"
    staging     = "172.50"
    production  = "172.100"
  }
}

data "aws_availability_zones" "this" {
  state = "available"
}

locals {
  private_subnets = [
    "${lookup(var.variable_vpc_cidr_block_prefixes, var.global_var_environment)}.10.0/24",
    "${lookup(var.variable_vpc_cidr_block_prefixes, var.global_var_environment)}.20.0/24"
  ]

  database_subnets = [
    "${lookup(var.variable_vpc_cidr_block_prefixes, var.global_var_environment)}.50.0/24",
    "${lookup(var.variable_vpc_cidr_block_prefixes, var.global_var_environment)}.60.0/24"
  ]

  public_subnets = [
    "${lookup(var.variable_vpc_cidr_block_prefixes, var.global_var_environment)}.80.0/24",
    "${lookup(var.variable_vpc_cidr_block_prefixes, var.global_var_environment)}.90.0/24"
  ]

  availability_zones = data.aws_availability_zones.this.names
}

variable "variable_internet_gateway_route" {
  type        = string
  description = "Default internet route cidr block for public route table"
  default     = "0.0.0.0/0"
}
# DB Subnet Security Group Rules
variable "variable_db_security_group_ingress_from_port" {
  type        = number
  default     = 4417
  description = "Default DB Security group incoming traffic from port"
}

variable "variable_db_security_group_ingress_to_port" {
  default     = 4417
  description = "Default DB Security group incoming traffic to port"
}

variable "variable_db_security_group_ingress_protocol" {
  default     = "tcp"
  description = "Default DB Security group incoming traffic protocol"
}

variable "variable_db_security_group_egress_from_port" {
  type        = number
  default     = 0
  description = "Default DB Security group outgoing traffic from port"
}

variable "variable_db_security_group_egress_to_port" {
  type        = number
  default     = 0
  description = "Default DB Security group outgoing traffic to port"
}

variable "variable_db_security_group_egress_protocol" {
  type        = number
  default     = -1
  description = "Default DB Security group outgoing traffic port"
}


# App Subnet Security Group Rules
variable "variable_app_security_group_ingress_from_port" {
  default     = 80
  description = "Default App Security group incoming traffic from port"
}

variable "variable_app_security_group_ingress_to_port" {
  default     = 80
  description = "Default App Security group incoming traffic to port"
}

variable "variable_app_security_group_ingress_protocol" {
  default     = "tcp"
  description = "Default App Security group incoming traffic protocol"
}

variable "variable_app_security_group_egress_from_port" {
  type        = number
  default     = 0
  description = "Default App Security group outgoing traffic from port"
}

variable "variable_app_security_group_egress_to_port" {
  type        = number
  default     = 0
  description = "Default App Security group outgoing traffic to port"
}

variable "variable_app_security_group_egress_protocol" {
  type        = number
  default     = -1
  description = "Default App Security group outgoing traffic port"
}


# ALB Security Group Rules
variable "variable_alb_security_group_ingress_from_port" {
  default     = 80
  description = "Default App Security group incoming traffic from port"
}

variable "variable_alb_security_group_ingress_to_port" {
  default     = 80
  description = "Default App Security group incoming traffic to port"
}

variable "variable_alb_security_group_egress_from_port" {
  type        = number
  default     = 0
  description = "Default App Security group outgoing traffic from port"
}

variable "variable_alb_security_group_egress_to_port" {
  type        = number
  default     = 0
  description = "Default App Security group outgoing traffic to port"
}

variable "variable_alb_security_group_ingress_protocol" {
  default     = "tcp"
  description = "Default ALB Security group incoming traffic protocol"
}

variable "variable_alb_security_group_egress_protocol" {
  type        = number
  default     = -1
  description = "Default App Security group outgoing traffic port"
}


# Public Subnet Security Group Rules
variable "variable_proxy_security_group_ingress_from_port" {
  default     = 80
  description = "Default App Security group incoming traffic from port"
}

variable "variable_proxy_security_group_ingress_to_port" {
  default     = 80
  description = "Default App Security group incoming traffic to port"
}

variable "variable_proxy_security_group_ingress_protocol" {
  default     = "tcp"
  description = "Default Proxy Security group incoming traffic protocol"
}

variable "variable_proxy_security_group_ingress_cidr_block" {
  default     = "0.0.0.0/0"
  description = "Default CIDR block for incoming traffic to proxies"
}

variable "variable_proxy_security_group_ingress_ssh_from_port" {
  default     = "22"
  description = "Default SSH from port for proxies"
}

variable "variable_proxy_security_group_ingress_ssh_to_port" {
  default     = "22"
  description = "Default SSH to port for proxies"
}

variable "variable_proxy_security_group_ssh_ingress_protocol" {
  default     = "tcp"
  description = "Default SSH protocol for proxies"
}

variable "variable_proxy_security_group_ssh_ingress_cidr_block" {
  default     = "0.0.0.0/0"
  description = "Default CIDR block for incoming ssh traffic to proxies"
}

variable "variable_proxy_security_group_egress_from_port" {
  type        = number
  default     = 0
  description = "Default App Security group outgoing traffic from port"
}

variable "variable_proxy_security_group_egress_to_port" {
  type        = number
  default     = 0
  description = "Default App Security group outgoing traffic to port"
}

variable "variable_proxy_security_group_egress_protocol" {
  type        = number
  default     = -1
  description = "Default App Security group outgoing traffic port"
}


#### END NETWORKING MODULE VARIABLES ######