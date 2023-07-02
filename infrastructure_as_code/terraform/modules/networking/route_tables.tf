resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.global_var_tag_name}-private-route-table"
  }
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.global_var_tag_name}-database-route-table"
  }
}

resource "aws_route_table" "public" {
  vpc_id     = aws_vpc.this.id
  depends_on = [aws_internet_gateway.this]


  tags = {
    Name = "${var.global_var_tag_name}-public-route-table"
  }
}


resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = var.variable_internet_gateway_route
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "private" {
  count          = length(local.private_subnets)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "database" {
  count          = length(local.database_subnets)
  subnet_id      = element(aws_subnet.database.*.id, count.index)
  route_table_id = aws_route_table.database.id
}

resource "aws_route_table_association" "public" {
  count          = length(local.public_subnets)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}