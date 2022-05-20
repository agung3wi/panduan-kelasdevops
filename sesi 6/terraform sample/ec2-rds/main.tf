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
  region = "ap-southeast-1"
}

variable "instance_tags" {
  type = list
  default = ["vm1", "vm2", "vm3"]
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_key_pair" "keypair_demo" {
  key_name   = "keypair_demo"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "allow_all" {
  name        = "allow-all-terraform"
  description = "Allow All Traffic"
  vpc_id      = aws_vpc.my_vpc.id

  tags = {
    Name = "allow_all"
  }
}

resource "aws_security_group_rule" "outgoing" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["172.16.0.0/16"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = "${aws_security_group.allow_all.id}"
}

resource "aws_security_group_rule" "incoming" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["172.16.0.0/16"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = "${aws_security_group.allow_all.id}"
}

resource "aws_security_group_rule" "allowssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = "${aws_security_group.allow_all.id}"
}

resource "aws_instance" "ec2" {
  count = 1
  ami           = "ami-0750a20e9959e44ff" # ubuntu 20.04 region singapura
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.keypair_demo.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]

  tags = {
    Name = element(var.instance_tags, count.index)
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  publicly_accessible = true
  skip_final_snapshot  = true
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
}