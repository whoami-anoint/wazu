variable "environment" {
  type    = string
  default = "staging"

}
// vpc variables
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

// subnet variables
variable "public_subnet_name" {
  type        = string
  default     = "WAZUF"
  description = "Tag for the public resource name"
}

variable "private_subnet_name" {
  type        = string
  default     = "WAZUF"
  description = "Tag for the public resource name"
}

variable "subnet_availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  description = "List of availability zones"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["172.17.0.0/24", "172.17.20.0/24"]
  description = "List of CIDR blocks for public subnets"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["172.17.40.0/24", "172.17.50.0/24"]
  description = "List of CIDR blocks for private subnets"
}

// security group
variable "wazuh_sg_name" {
  type    = string
  default = "terraform-web-default-sg"

}

variable "wazuh_sg_ingress_ports" {
  type        = list(string)
  default     = ["22", "80", "443"]
  description = "port of security group will be created"
}

variable "wazuh_sg_ingress_cidrs" {
  type        = list(string)
  default     = ["0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0"]
  description = "cidr of security group will be created"
}


variable "key_pair_name" {
  type    = string
  default = "wazuh_private_key"

}
variable "wazuh-instance-type" {
  type    = string
  default = "t3.large"

}

// AMI
variable "wazuh_latest_ami" {
  type    = string
  default = "ami-0e2c8caa4b6378d8c"
}
