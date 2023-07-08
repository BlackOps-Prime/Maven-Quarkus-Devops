resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id


  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-internet-gateway"
  }
}