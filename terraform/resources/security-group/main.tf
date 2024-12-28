resource "aws_security_group" "web-sg" {
  name        = var.sg_name
  description = var.description
  vpc_id      = var.vpc_id

  # Create ingress rules based on ports and corresponding CIDRs
  dynamic "ingress" {
    for_each = [for i in range(length(var.sg_ingress_ports)) : {
      port = var.sg_ingress_ports[i]
      cidr = var.sg_ingress_cidrs[i]
    }]
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = [ingress.value.cidr]
      description = "allow-port-${ingress.value.port}"
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow-all-egress"
  }

  tags = {
    Name        = var.sg_name
    Project     = var.project
    Creator     = var.creator
    Environment = var.environment
  }

  lifecycle {
    prevent_destroy = false
    #ignore_changes  = [tags] 
  }
}
