output "private_subnet_ids" {
  # value = aws_subnet.private_subnets[*].id
  # value = { for subnet in aws_subnet.private_subnets : subnet.id => subnet.cidr_block }
  value = [for subnet in aws_subnet.private_subnets : subnet.id]

}

output "public_subnet_ids" {
  # value = aws_subnet.public_subnets.*.id
  # value = { for subnet in aws_subnet.public_subnets : subnet.id => subnet.cidr_block }
  value = [for subnet in aws_subnet.public_subnets : subnet.id]

}

output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "Private route table id"
}


output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "Public route table id"
}

output "public_subnet_cidrs" {
  description = "CIDR blocks of the created Public subnets"
  value       = [for subnet in aws_subnet.public_subnets : subnet.cidr_block]
}

output "private_subnet_cidrs" {
  description = "CIDR blocks of the created Private subnets"
  value       = [for subnet in aws_subnet.private_subnets : subnet.cidr_block]
}
