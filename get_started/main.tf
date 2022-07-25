terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.23.0"
    }
  }
}

variable "instance_type" {
  type = string
}

locals {
  project_name = "terrafael"
}


provider "aws" {
    # configuration options
    profile = "default"
    region  = "us-east-1"
}

resource "aws_instance" "my_server" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = var.instance_type

  tags = {
    Name = "MyServer-${local.project_name}"
  }
}

output "public_ip" {
  value = aws_instance.my_server.public_ip
}
