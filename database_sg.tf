# Create Database Security Group
resource "aws_security_group" "database-sg" {
  name        = var.security_group_names[2]
  description = "Allow inbound traffic from application layer"
  vpc_id      = aws_vpc.vpc1.id
  ingress {
    description     = "Allow traffic from application layer"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.vpc1_security_group.id]
  }
  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #  tags = {
  #    Name = "Database SG"
  #  }
}