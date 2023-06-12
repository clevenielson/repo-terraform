terraform {
  required_version = "0.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "app-01" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = var.instance_tag
}

