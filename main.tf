
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.56"
		}
	}
}

resource "aws_security_group_rule" "group" {
	for_each          = var.services
  type              = "ingress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  cidr_blocks       = ["${each.value.node_address}/32"]
  description       = "security group rule added by CTS"
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "group2" {
        for_each          = var.services
  type              = "ingress"
  from_port         = "8081"
  to_port           = "8081"
  protocol          = "tcp"
  cidr_blocks       = ["${each.value.node_address}/32"]
  description       = "security group rule added by CTS"
  security_group_id = var.security_group_id
}
