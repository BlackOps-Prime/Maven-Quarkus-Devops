variable "global_var_environment" {
  type        = string
  description = "Default Environment"
}

variable "global_var_region" {
  type        = string
  description = "Default AWS region"
}

variable "global_var_profile" {
  type        = string
  description = "Default AWS profile"
}

variable "global_var_tag_name" {}

variable "variable_vpc_cidr_block_prefixes" {}

variable "variable_vpc_private_subnet_count" {}


variable "global_var_provider_shared_config" {
  default = ["/Users/christopher.afeku/.aws/config"]
}

variable "global_var_provider_shared_credentials" {
  default = ["/Users/christopher.afeku/.aws/credentials"]
}

variable "variable_instance_count" {}