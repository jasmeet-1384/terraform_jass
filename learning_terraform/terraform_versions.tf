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


