resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidr_blocks)

  cidr_block                          = var.private_subnet_cidr_blocks[count.index]
  private_dns_hostname_type_on_launch = "ip-name"
  vpc_id                              = var.vpc_id
  availability_zone                   = element(var.subnet_availability_zones, count.index)

  tags = {
    Name        = "${var.private_subnet_name}-private-subnet-${count.index + 1}"
    Project     = var.project
    Creator     = var.creator
    Environment = var.environment
  }
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  tags = {
    Name    = "${var.private_route_table_name}-private-route-table"
    Project = var.project
    Creator = var.creator
  }
}

# Associate public subnets with public route table
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private.id
}


resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw-id
}