output "vpc_id" {
  value = module.vpc.vpc-id
}

output "public_subnet_cidr_output" {
  value = module.subnets.public_subnet_cidrs
}

output "private_subnet_cidr_output" {
  value = module.subnets.private_subnet_cidrs
}

# output "launch_template_name" {
#   value = module.ec2_launch.launch_template_name
# }

# output "launch_template_latest_version" {
#   value = module.ec2_launch.launch_template_latest_version
# }