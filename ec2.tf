# Define the EC2 instances
# 2 instances in private subnet for vpc1
resource "aws_instance" "ec2_instance" {
  count                  = 2
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.vpc1_subnet2.id
  key_name               = var.key_name
  user_data              = file("data.sh")
  vpc_security_group_ids = [aws_security_group.vpc1_security_group.id]
  tags = {
    Name = "ec2-instance-${count.index + 1}"
  }
}


# Creating 1st EC2 instance in Public Subnet for vpc1
resource "aws_instance" "demoinstanceone" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.vpc1_security_group.id]
  subnet_id                   = aws_subnet.vpc1_subnet1.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  tags = {
    Name = "My Public Instance"
  }
}

# Define the EC2 instances
# 2 instances in private subnet for vpc2
resource "aws_instance" "ec2_instance2" {
  count                  = 2
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.vpc2_subnet2.id
  key_name               = var.key_name
  user_data              = file("data.sh")
  vpc_security_group_ids = [aws_security_group.vpc2_security_group.id]
  tags = {
    Name = "ec2-instance2.0-${count.index + 1}"
  }
}

# Creating 1st EC2 instance in Public Subnet for vpc1
resource "aws_instance" "publicforvpc2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.vpc2_security_group.id]
  subnet_id                   = aws_subnet.vpc2_subnet1.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  tags = {
    Name = "My Public Instance2"
  }
}