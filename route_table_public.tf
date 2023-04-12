# Creating Route Table for vpc1
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demogateway.id
  }
  tags = {
    Name = "public route"
  }
}
# Associating Route Table
resource "aws_route_table_association" "rt1" {
  subnet_id      = aws_subnet.vpc1_subnet1.id
  route_table_id = aws_route_table.public.id
}


# Create a NAT gateway in the public subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.vpc1_subnet1.id
}

# Create an Elastic IP address for the NAT gateway
resource "aws_eip" "nat" {
  vpc = true
}

# Create the private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc1.id
  # Add a default route to the NAT gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private route"
  }

}

# Associating Route Table
resource "aws_route_table_association" "rt2" {
  subnet_id      = aws_subnet.vpc1_subnet2.id
  route_table_id = aws_route_table.private.id
}
# Associating Route Table
resource "aws_route_table_association" "rt3" {
  subnet_id      = aws_subnet.vpc1_subnet3.id
  route_table_id = aws_route_table.private.id
}
# Associating Route Table
resource "aws_route_table_association" "rt4" {
  subnet_id      = aws_subnet.vpc1_subnet4.id
  route_table_id = aws_route_table.private.id
}


# Creating public Route Table for vpc2
resource "aws_route_table" "public2" {
  vpc_id = aws_vpc.vpc2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demogateway2.id
  }
  tags = {
    Name = "public route2"
  }
}
# Associating Route Table
resource "aws_route_table_association" "rt7" {
  subnet_id      = aws_subnet.vpc2_subnet1.id
  route_table_id = aws_route_table.public2.id
}


# Create the private route table for vpc2
resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.vpc2.id

  tags = {
    Name = "private route2"
  }
}

# Associating Route Table
resource "aws_route_table_association" "rt5" {
  subnet_id      = aws_subnet.vpc2_subnet2.id
  route_table_id = aws_route_table.private2.id
}
# Associating Route Table
resource "aws_route_table_association" "rt6" {
  subnet_id      = aws_subnet.vpc2_subnet3.id
  route_table_id = aws_route_table.private2.id
}

