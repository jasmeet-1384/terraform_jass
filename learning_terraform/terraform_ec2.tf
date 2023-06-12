
/*

#resource: EC2 Instance
resource "aws_instance" "jass_app_server" {
  ami           = data.aws_ami.amz-linux2.id
instance_type = var.instance_type #This is for singal value given
# instance_type = var.instance_type_list[1] This is for list type instance
# For Map Type - Instance Type
#instance_type = var.instance_type_map["prod"]
  key_name = var.insatance_key_pair
  user_data     = file("${path.module}/jass.sh")
  vpc_security_group_ids = [ 
    aws_security_group.vpc-ssh-jass.id
   ]
  
   # Create EC2 Instance in all Availabilty Zones of a VPC
  #  for_each = toset(data.aws_availability_zones.my_azones.names)
  # availability_zone = each.key # You can also use each.value because for list items each.key == each.value

  # Create EC2 Instance in all Availabilty Zones of a VPC
   for_each = toset(keys({ for az, details in data.aws_ec2_instance_type_offerings.my_instance_type :
  az => details.instance_types if length(details.instance_types) != 0 }))
  availability_zone = each.key # You can also use each.value because for list items each.key == each.value
   
# count = var.vm_count
  tags = {
    # Name = "${var.instance_name}-${count.index}-${each.key}"
    Name = "${var.instance_name}-${each.key}"
  }
}
*/