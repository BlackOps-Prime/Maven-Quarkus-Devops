variable "variable_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Default instance type"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


data "aws_availability_zones" "this" {
  state = "available"
}

locals {

  availability_zones = data.aws_availability_zones.this.names
}

variable "variable_instance_count" {
  type        = number
  default     = 1
  description = "Default instance count"
}

variable "variable_instance_security_groups" {
  description = "Default instance security group"
}


variable "variable_instance_public_subnet_ids" {}

variable "global_var_tag_name" {}

variable "global_var_environment" {}