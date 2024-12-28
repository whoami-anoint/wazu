resource "aws_instance" "ec2_instance" {
  count = length(var.instance_name)

  ami                         = var.ami_id[count.index]
  subnet_id                   = var.subnet_id[count.index]
  instance_type               = var.instance_type[count.index]
  associate_public_ip_address = true
  security_groups             = [var.security_group_id[count.index]]
  key_name                    = var.key_pair_name[count.index]

  ebs_block_device {
    device_name           = "/dev/sda1"
    volume_size           = var.root_volume_size_gb[count.index]
    volume_type           = "gp3"
    delete_on_termination = true
  }

  lifecycle {
    ignore_changes = [
      instance_type, security_groups, subnet_id, associate_public_ip_address
    ]
  }

  tags = {
    Name        = var.instance_name[count.index]
    Project     = var.project
    Creator     = var.creator
    Environment = var.environment
  }
}


