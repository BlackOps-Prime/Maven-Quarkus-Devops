resource "aws_subnet" "private" {
  count             = length(local.private_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(local.private_subnets, count.index)
  availability_zone = element(local.availability_zones, count.index)
  depends_on        = [aws_vpc.this]


  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-${element(local.availability_zones, count.index)}-private-subnet"
  }

}

resource "aws_subnet" "database" {
  count             = length(local.database_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(local.database_subnets, count.index)
  availability_zone = element(local.availability_zones, count.index)
  depends_on        = [aws_vpc.this]


  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-${element(local.availability_zones, count.index)}-database-subnet"
  }

}

resource "aws_subnet" "public" {
  count             = length(local.public_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(local.public_subnets, count.index)
  availability_zone = element(local.availability_zones, count.index)
  depends_on        = [aws_vpc.this]


  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-${element(local.availability_zones, count.index)}-public-subnet"
  }

}