# Create VPC #1
resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc1_cidr_block
  tags = {
    Name = var.vpc1_name
  }
}

# Create VPC #2
resource "aws_vpc" "vpc2" {
  cidr_block = var.vpc2_cidr_block
  tags = {
    Name = var.vpc2_name
  }
}