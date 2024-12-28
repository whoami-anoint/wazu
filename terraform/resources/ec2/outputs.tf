
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = [for instance in aws_instance.ec2_instance : instance.id]
}


output "ec2_public_dns_names" {
  description = "The Public DNS names of the EC2 instances"
  value       = [for instance in aws_instance.ec2_instance : instance.public_dns]
}

output "public_ip_address" {

  value = [for instance_ip in aws_instance.ec2_instance : instance_ip.public_ip]
}

output "private_ip_address" {
  value = [for instance_ip in aws_instance.ec2_instance : instance_ip.private_ip]
}