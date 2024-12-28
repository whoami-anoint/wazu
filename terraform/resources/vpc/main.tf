resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    Name    = var.vpc_name
    Project = var.project
    Creator = var.creator
    env     = var.environment

  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = var.gateway_name
    Project     = var.project
    Creator     = var.creator
    Environment = var.environment
  }
}