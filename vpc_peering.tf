# Create Peering Connection
resource "aws_vpc_peering_connection" "peering_connection" {
  vpc_id      = aws_vpc.vpc1.id
  peer_vpc_id = aws_vpc.vpc2.id
  auto_accept = true
}

# Peering Connection Requester (VPC 1)
resource "aws_vpc_peering_connection" "vpc1_vpc2" {
  vpc_id      = aws_vpc.vpc1.id
  peer_vpc_id = aws_vpc.vpc2.id
  auto_accept = true
}

# Peering Connection Accepter (VPC 2)
resource "aws_vpc_peering_connection_accepter" "vpc2_vpc1" {
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc2.id
}

## Create routes to enable communication
#resource "aws_route" "route_vpc1_to_vpc2" {
#  route_table_id            = aws_route_table.public.id
#  destination_cidr_block    = aws_vpc.vpc2.cidr_block
#  vpc_peering_connection_id = aws_vpc_peering_connection.peering_connection.id
#}
#
#resource "aws_route" "route_vpc2_to_vpc1" {
#  route_table_id            = aws_route_table.public2.id
#  destination_cidr_block    = aws_vpc.vpc1.cidr_block
#  vpc_peering_connection_id = aws_vpc_peering_connection.peering_connection.id
#}

# Route for VPC 1 to VPC 2
resource "aws_route" "vpc1_to_vpc2" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = aws_vpc.vpc2.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc2.id
}

# Route for VPC 2 to VPC 1
resource "aws_route" "vpc2_to_vpc1" {
  route_table_id            = aws_route_table.private2.id
  destination_cidr_block    = aws_vpc.vpc1.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc2.id
}

## Route for VPC 1 to VPC 2
#resource "aws_route" "vpc1_to_vpc2" {
#  route_table_id            = aws_route_table.public.id
#  destination_cidr_block    = aws_vpc.vpc2.cidr_block
#  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc2.id
#}
#
## Route for VPC 2 to VPC 1
#resource "aws_route" "vpc2_to_vpc1" {
#  route_table_id            = aws_route_table.public2.id
#  destination_cidr_block    = aws_vpc.vpc1.cidr_block
#  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc2.id
#}