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

resource "aws_vpc" "production" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "production"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.production.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Prod Subnet"
  }
}

# resource "aws_instance" "web" {
#     ami = "ami-0f8ca728008ff5af4"
#     instance_type = "t3.micro"

#     tags = {
#       "Name" = "Ubuntu Server"
#     }
# }