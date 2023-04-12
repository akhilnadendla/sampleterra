# Create VPC #1 subnets
resource "aws_subnet" "vpc1_subnet1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.vpc1_subnet_cidr_blocks[0]
  availability_zone = "us-east-1a"
  tags = {
    Name = var.vpc1_subnet_names[0]
  }
}

resource "aws_subnet" "vpc1_subnet2" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.vpc1_subnet_cidr_blocks[1]
  availability_zone = "us-east-1b"
  tags = {
    Name = var.vpc1_subnet_names[1]
  }
}

resource "aws_subnet" "vpc1_subnet3" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.vpc1_subnet_cidr_blocks[2]
  availability_zone = "us-east-1a"
  tags = {
    Name = var.vpc1_subnet_names[2]
  }
}

resource "aws_subnet" "vpc1_subnet4" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.vpc1_subnet_cidr_blocks[3]
  availability_zone = "us-east-1b"
  tags = {
    Name = var.vpc1_subnet_names[3]
  }
}

# Create VPC #2 subnets
resource "aws_subnet" "vpc2_subnet1" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = var.vpc2_subnet_cidr_blocks[0]
  availability_zone = "us-east-1a"
  tags = {
    Name = var.vpc2_subnet_names[0]
  }
}

resource "aws_subnet" "vpc2_subnet2" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = var.vpc2_subnet_cidr_blocks[1]
  availability_zone = "us-east-1b"
  tags = {
    Name = var.vpc2_subnet_names[1]
  }
}

resource "aws_subnet" "vpc2_subnet3" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = var.vpc2_subnet_cidr_blocks[2]
  availability_zone = "us-east-1a"
  tags = {
    Name = var.vpc2_subnet_names[2]
  }
}




