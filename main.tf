
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.56"
		}
	}
}
provider "aws" {
  region  = "us-east-1"
  #version = "~> 3.0"
  #shared_credentials_file = ""
  #profile = ""
  #access_key = "AWS_ACCESS_KEY_ID"
  #secret_key = "AWS_SECRET_ACCESS_KEY"
  #token = "AWS_SESSION_TOKEN"
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
