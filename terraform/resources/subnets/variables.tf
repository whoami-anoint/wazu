// common variable
variable "vpc_id" {
  type        = string
  description = "VPC ID used to create subnet"
}

variable "subnet_availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}

variable "igw-id" {
  type        = string
  description = "Internet Gateway ID which the public route table will point to."
}

// private subnet config
variable "private_subnet_name" {
  type        = string
  default     = "WAZUF-private"
  description = "Tag for the private resource name"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "private_route_table_name" {
  type        = string
  default     = "WAZUF-private-route-table"
  description = "the private route-table resource name"
}

// public subnet varaiable
variable "public_subnet_name" {
  type        = string
  default     = "WAZUF-public"
  description = "Tag for the public resource name"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "public_route_table_name" {
  type        = string
  default     = "WAZUF-public-route-table"
  description = "the public route-table resource name"
}

// tag variable
variable "project" {
  type        = string
  default     = "WAZUF"
  description = "Tag for project name"
}

variable "creator" {
  type        = string
  default     = "pingabisec@gmail.com"
  description = "Tag for creator name"
}

variable "environment" {
  type        = string
  default     = "staging"
  description = "enviorment for  the product"
}