// security group
variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = "WAZUF-secuity-group-terraform"
}

variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string
}



variable "description" {
  description = "Description of the security group"
  type        = string
  default     = "Allowing from outside"
}

// for ingress port, cidr etc
variable "sg_ingress_ports" {
  type        = list(string)
  description = "port of security group will be created"
}
variable "sg_ingress_cidrs" {
  type        = list(string)
  description = "cidr of security group will be created"
}

// for tag
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
  description = "enviorment for  the product"
}