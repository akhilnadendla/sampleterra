## Creating RDS Instance
#resource "aws_db_subnet_group" "default" {
#  name       = "main"
#  subnet_ids = [aws_subnet.vpc1_subnet3.id, aws_subnet.vpc1_subnet4.id]
#  tags = {
#    Name = "My DB subnet group"
#  }
#}
#resource "aws_db_instance" "default" {
#  allocated_storage      = var.db_allocated_storage
#  db_subnet_group_name   = aws_db_subnet_group.default.id
#  engine                 = var.db_engine
#  engine_version         = var.db_engine_version
#  instance_class         = var.db_instance_class
#  multi_az               = false
#  identifier             = var.db_name
#  username               = var.db_username
#  password               = var.db_password
#  #skip_final_snapshot    = false
#  vpc_security_group_ids = [aws_security_group.database-sg.id]
#}
#
#resource "aws_db_instance" "example_replica" {
#  identifier           = var.db_replica_name
#  engine               = var.db_engine
#  engine_version       = var.db_engine_version
#  instance_class       = var.db_instance_class
#  username             = var.db_username
#  password             = var.db_password
#  allocated_storage    = var.db_allocated_storage
#  db_subnet_group_name = aws_db_subnet_group.default.name
#}