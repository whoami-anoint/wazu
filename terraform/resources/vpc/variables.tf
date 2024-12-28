//vpc

variable "vpc_name" {
  type        = string
  default     = "WAZUF-terraform-VPC"
  description = "Tag for project"
}

variable "cidr_block" {
  type        = string
  default     = "172.17.0.0/16"
  description = "CIDR bolck used for VPC"
}

variable "gateway_name" {
  type        = string
  default     = "WAZUF-internet-gateway"
  description = "Tag for project"
}

// tags
variable "project" {
  type        = string
  default     = "WAZUF"
  description = "Tag for project"
}

variable "creator" {
  type        = string
  default     = "pingabisec@gmail.com"
  description = "Tag for project"
}

variable "environment" {
  type        = string
  default     = "stagging"
  description = "environment for  the product"
}

variable "instance_tenancy" {
  type        = string
  description = "Tenancy option for instances launched inside the VPC"
  default     = "default"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Boolean value to enable/disable DNS hostnames in the VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Boolean value to enable/disable DNS support in the VPC"
  default     = true
}