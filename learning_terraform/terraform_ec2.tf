#resource: EC2 Instance
resource "aws_instance" "jass_app_server" {
  ami           = data.aws_ami.amz-linux2.id
#   instance_type = var.instance_type This is for singal value given
# instance_type = var.instance_type_list[1] This is for list type instance
# For Map Type - Instance Type
instance_type = var.instance_type_map["prod"]
  key_name = var.insatance_key_pair
  user_data     = file("${path.module}/jass.sh")
  vpc_security_group_ids = [ 
    aws_security_group.vpc-ssh-jass.id
   ]

  tags = {
    Name = var.instance_name
  }
}
