// Network Infrasctutcure
module "vpc" {
  source      = "../../resources/vpc"
  vpc_name    = var.vpc_name
  cidr_block  = var.cidr_block
  environment = var.environment
}

module "subnets" {
  source                     = "../../resources/subnets"
  vpc_id                     = module.vpc.vpc-id
  igw-id                     = module.vpc.igw-id
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  subnet_availability_zones  = var.subnet_availability_zones
}

module "wazuh_security_group" {
  source           = "../../resources/security-group"
  vpc_id           = module.vpc.vpc-id
  sg_name          = var.wazuh_sg_name
  sg_ingress_ports = var.wazuh_sg_ingress_ports
  sg_ingress_cidrs = var.wazuh_sg_ingress_cidrs
}


module "ec2_instance" {
  source        = "../../resources/ec2"
  instance_name = ["[Threat-hunting]wazuh-server"]
  instance_type = [var.wazuh-instance-type,
  ]

  key_pair_name = [var.key_pair_name]
  ami_id        = [var.wazuh_latest_ami]
  subnet_id = [
    module.subnets.public_subnet_ids[0], // wazuh
  ]
  root_volume_size_gb = ["60"]
  security_group_id   = [module.wazuh_security_group.web_security_group_id]
}
