resource "aws_vpc" "this" {
  cidr_block           = "${lookup(var.variable_vpc_cidr_block_prefixes, var.global_var_environment)}.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.global_var_tag_name}-vpc"
  }
}