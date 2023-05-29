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
  default = "t2.large"
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
  default = {
    "dev" = "t2.micro"
    "qa" = "t3.micro"
    "prod" = "t2.large"
  }
}


#count(Number of virtual machines)
variable "vm_count" {
  description = "Number of virtual Machines"
  type = string
  default = 2
  
}