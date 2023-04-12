# Creating Internet Gateway
resource "aws_internet_gateway" "demogateway" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = var.igw_names[0]
  }
}

# Creating Internet Gateway
resource "aws_internet_gateway" "demogateway2" {
  vpc_id = aws_vpc.vpc2.id
  tags = {
    Name = var.igw_names[1]
  }
}