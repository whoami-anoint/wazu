output "vpc-id" {
  value       = aws_vpc.main.id
  description = "My VPC ID"
}

output "igw-id" {
  value       = aws_internet_gateway.default.id
  description = "The ID of the Internet Gateway"
}