# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amz-linux2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

# Get List of Availability Zones in a Specific Region
# Region is set in c1-versions.tf in Provider Block
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# EC2 Instance Type Offerings (semi-dynamic)
# data "aws_ec2_instance_type_offerings" "my_instance_type" {
#   for_each = toset([ "ap-south-1a", "ap-south-1b" ]) 
#   filter {
#     name   = "instance-type"
#     values = ["t2.large"]
#   }

#   filter {
#     name   = "location"
#     values = [each.key]
#   }

#   location_type = "availability-zone-id"
# }

# EC2 Instance Type Offerings (Fully-dynamic)
data "aws_ec2_instance_type_offerings" "my_instance_type" {
  for_each = toset(data.aws_availability_zones.my_azones.names)
  filter {
    name   = "instance-type"
    values = ["t2.large"] 
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}
