terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.70"
    }
  }

}

provider "aws" {
  profile = "default"
  region = "eu-west-2"
}

variable "instance_tags" {
  type = list
  default = ["dev", "prod", "vm3"]
}

resource "aws_key_pair" "keypair_demo" {
  key_name   = "keypair_demo"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "allow_all" {
  name        = "allow-all-terraform"
  description = "Allow All Traffic"

  tags = {
    Name = "allow_all"
  }
}

resource "aws_security_group_rule" "outgoing" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = "${aws_security_group.allow_all.id}"
}

resource "aws_security_group_rule" "incoming" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = "${aws_security_group.allow_all.id}"
}

resource "aws_instance" "ec2" {
  count = 2
  ami           = "ami-0beb6fc68811e5682" # ubuntu 20.04 region singapura
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.keypair_demo.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]

  tags = {
    Name = element(var.instance_tags, count.index)
  }
}