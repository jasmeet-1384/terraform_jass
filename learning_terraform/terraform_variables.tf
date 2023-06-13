#Name Tag Variable
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "jass_instance"
}

#AWS Region
variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type = string
  default = "ap-south-1"
}

#AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Insatnce Type"
  type = string
  default = "t2.micro"
}

#AWS EC2 Instance Key Pair
variable "insatance_key_pair" {
  description = "AWS EC2 key pair that need to be associated with EC2 Instance"
  type = string
  default = "testjasmeet"
}

#AWS EC2 Instance Type List
variable "instance_type_list" {
  description = "EC2 Instance type"
  type = list(string)
  default = [ "t2.micro", "t2.small", "t3.micro" ]

}

#AWS EC2 Instance Type -Map
variable "instance_type_map" {
  description = "EC2 Instance Type Map"
  type = map(string)
  # #default = {
  #   "dev" = "t2.micro"
  #   "qa" = "t3.micro"
  #   "prod" = "t2.large"
  # }
}


#count(Number of virtual machines)
variable "vm_count" {
  description = "Number of virtual Machines"
  type = string
  #default = 2
  
}

#Environment Variable
variable "environment" {
  description = "Environment variable used as a prefix"
  type = string
  #default = "dev"
  
}

#Department
variable "department" {
  description = "department- this Infrastructure belongs"
  type = string
  #default = "IT"
}


# VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type = string
  ##default = "my-vpc-jass"
}

# VPC CIDR
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string
  ##default = "10.0.0.0/16"
}

# VPC Availability Zones
 variable "availability_zone" {
   description = "Availability Zone"
   type = list(string)
   ##default = [ "ap-south-1a", "ap-south-1b" ]
 }

# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnet"
  type = list(string)
  ##default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnet"
  type = list(string)
  #default = [ "10.0.101.0/24", "10.0.102.0/24" ]
}

# VPC Database Subnets
variable "vpc_database_subnets" {
  description = "VPC Database Subnet"
  type = list(string)
  #default = [ "10.0.21.0/24", "10.0.22.0/24" ]
}

# VPC Create Database Subnet Route Table (True or False)
variable "vpc_create_database_subnet_group" {
  description = "VPC Create Database Subnet Group"
  type = bool
  #default = true
}

# VPC Create Database Subnet Route Table (True or False)
variable "vpc_create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"
  type = bool
  #default = true
}

# VPC Create Database Subnet Route Table (True or False)
variable "vpc_enable_nat_gateway" {
  description = "VPC Enable Nat Gateway"
  type = bool
  #default = true
}

# VPC Create Database Subnet Route Table (True or False)
variable "vpc_single_nat_gateway" {
  description = "VPC Single Nat Gateway"
  type = bool
  #default = true
}


#sg name 
variable "name" {
  type = string

}

#private instance count
variable "private_instance_count" {
  type = string
  
}

#subnet_ids
variable "subnet_id" {
  type = list(string)
  #default     = []
}