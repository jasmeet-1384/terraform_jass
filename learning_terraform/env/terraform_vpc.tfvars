# Generic Variables
aws_region  = "ap-south-1"
environment = "dev"
department  = "IT"


#VPC Variables
vpc_name                               = "myvpc-jass"
vpc_cidr_block                         = "10.0.0.0/16"
availability_zone                      = ["ap-south-1a", "ap-south-1b"]
vpc_public_subnets                     = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_private_subnets                    = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24"]
vpc_create_database_subnet_group       = true
vpc_create_database_subnet_route_table = true
vpc_enable_nat_gateway                 = true
vpc_single_nat_gateway                 = true

#Count
vm_count = 2

#Instance type
instance_type_map = {
  "dev"  = "t2.micro"
  "qa"   = "t3.micro"
  "prod" = "t2.large"
}

private_instance_count = 1

#security group name public
name = "jass_sg"

