resource "aws_instance" "proxy" {
  count             = var.variable_instance_count
  ami               = data.aws_ami.ubuntu.id
  instance_type     = var.variable_instance_type
#   availability_zone = element(local.availability_zones, count.index)
  subnet_id         = var.variable_instance_public_subnet_ids
  security_groups   = var.variable_instance_security_groups
  associate_public_ip_address = true


  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-proxy-server"
  }
}


