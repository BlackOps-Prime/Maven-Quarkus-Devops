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


#### END NETWORKING MODULE VARIABLES ######
