variable "vpc1_cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc2_cidr_block" {
  default = "192.168.0.0/16"
}

variable "vpc1_name" {
  default = "alpha"
}

variable "vpc2_name" {
  default = "beta"
}

## Defining CIDR Block for 1st Subnet
#variable "subnet1_cidr" {
#  default = "10.0.1.0/24"
#}
## Defining CIDR Block for 2nd Subnet
#variable "subnet2_cidr" {
#  default = "10.0.2.0/24"
#}
## Defining CIDR Block for 3rd Subnet
#variable "subnet3_cidr" {
#  default = "10.0.3.0/24"
#}
## Defining CIDR Block for 4th Subnet
#variable "subnet4_cidr" {
#  default = "10.0.4.0/24"
#}
## Defining CIDR Block for 5th Subnet
#variable "subnet5_cidr" {
#  default = "192.168.1.0/16"
#}
## Defining CIDR Block for 6th Subnet
#variable "subnet6_cidr" {
#  default = "192.168.2.0/16"
#}
#
## Defining CIDR Block for 7th Subnet
#variable "subnet7_cidr" {
#  default = "192.168.3.0/16"
#}

variable "vpc1_subnet_cidr_blocks" {
  description = "List of CIDR blocks for VPC #1 subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
}

variable "vpc2_subnet_cidr_blocks" {
  description = "List of CIDR blocks for VPC #2 subnets"
  type        = list(string)
  default     = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
}

variable "vpc1_subnet_names" {
  description = "List of name tags for VPC #1 subnets"
  type        = list(string)
  default     = ["pub_web", "pri_web", "pri_DB1", "pri_DB2"]
}

variable "vpc2_subnet_names" {
  description = "List of name tags for VPC #2 subnets"
  type        = list(string)
  default     = ["pub_ALB", "pri_ASG", "pri_ASG"]
}

variable "igw_names" {
  type    = list(string)
  default = ["igw1", "igw2"]
}

variable "security_group_names" {
  type    = list(string)
  default = ["my-security-group1", "my-security-group2", "Database-SG"]
}

variable "security_group_description" {
  type    = string
  default = "This is my security group"
}

variable "inbound_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks = ["0.0.0.0/0"]
    },

  ]
}

variable "outbound_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "db_name" {
  type    = string
  default = "example-db-instance"
}

variable "db_replica_name" {
  type    = string
  default = "example-db-replica"
}

variable "db_engine" {
  type    = string
  default = "mysql"
}

variable "db_engine_version" {
  type    = string
  default = "5.7"
}

variable "db_instance_class" {
  type    = string
  default = "db.t2.micro"
}

variable "db_username" {
  type    = string
  default = "exampleuser"
}

variable "db_password" {
  type    = string
  default = "kronos1234"
}

variable "db_allocated_storage" {
  type    = number
  default = 10
}

#variable "subnet_ids" {
#  type    = list(string)
#  default = ["subnet-12345678", "subnet-23456789"]
#}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  default     = "ami-087c17d1fe0178315"
}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access to the EC2 instances"
  default     = "terraform"
}