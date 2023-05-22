terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-south-1"
}

resource "aws_instance" "jass_app_server" {
  ami           = "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"

  tags = {
    Name = "jass_instance"
  }
}
