terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  profile = "experiment"
}


resource "aws_instance" "web" {
    ami = "ami-0f8ca728008ff5af4"
    instance_type = "t3.micro"

    tags = {
      "Name" = "Ubuntu Server"
    }
}