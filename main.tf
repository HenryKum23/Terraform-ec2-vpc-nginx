provider "aws" {
  region = "us-east-2"
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
}

resource "aws_key_pair" "henrykey" {
  key_name   = "demokey"
  public_key = file("/Users/zhouchunni/Desktop/demokey.pem")
}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"
  count   = 1

  name = "ec2-nginx-demo"

  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.nginx_demo.id]
  key_name               = aws_key_pair.henrykey.key_name
  user_data              = file("userdata.tpl")

  tags = {
    Name = "NginxDemo"
  }
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "nginx_demo" {
  name        = "nginx_demo"
  description = "SSH on port 22 and HTTP on port 80"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

