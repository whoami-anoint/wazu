
# Create public subnets
resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidr_blocks)

  cidr_block                          = var.public_subnet_cidr_blocks[count.index]
  vpc_id                              = var.vpc_id
  map_public_ip_on_launch             = true
  private_dns_hostname_type_on_launch = "ip-name"
  availability_zone                   = element(var.subnet_availability_zones, count.index)

  tags = {
    Name = "${var.public_subnet_name}-public-subnet-${count.index + 1}"

    Environment = var.environment
    Project     = var.project
    Creator     = var.creator
  }
}

# Create route table for public subnets
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.public_route_table_name}-public-route-table"
    Project     = var.project
    Creator     = var.creator
    Environment = var.environment

  }
}

# Associate public subnets with public route table
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public.id
}


resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw-id
}


# resource "aws_route_table_association" "public_subnet_association" {
#   for_each       = aws_subnet.public_subnets
#   subnet_id      = each.value.id
#   route_table_id = aws_route_table.public.id
# }