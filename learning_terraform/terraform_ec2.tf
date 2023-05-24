terraform {
  backend "remote" {
    organization = "hashicrop-learn-jass"
    workspaces {
      name = "terraform_jass"
    }
  }

  required_version = "~>1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "jass_app_server" {
  ami           = "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  user_data = file("${path.module}/jass.sh")

  tags = {
    Name = var.instance_name
  }
}
