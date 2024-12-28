variable "instance_name" {
  description = "Type of EC2 instance"
  type        = list(string)
  default     = ["WAZUF-ec2"]
}

variable "ami_id" {
  type        = list(string)
  default     = ["ami-060e277c0d4cce553"]
  description = "Amazon Machine Image (AMI) ID for the instance. Default Ubuntu Server 24.04 LTS (HVM) image"
}

variable "subnet_id" {
  type        = list(string)
  default     = []
  description = "Subnet ID where the EC2 instance will be deployed"
}

variable "security_group_id" {
  type        = list(string)
  default     = []
  description = "Security group ID(s) assigned to the EC2 instance"
}

variable "instance_type" {
  type        = list(string)
  default     = ["t2.micro"]
  description = "type of EC2 instance in terms of CPU capacity"
}

variable "root_volume_size_gb" {
  type        = list(string)
  default     = ["60"]
  description = "Size of the root volume attached to the EC2 instance"
}

variable "key_pair_name" {
  type = list(string)

}

// variable for tag
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

