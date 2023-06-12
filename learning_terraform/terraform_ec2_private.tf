# EC2 Instances that will be created in VPC Private Subnets
module "ec2_private" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "5.1.0"

  name = "${var.environment}-Jass-VM"
  ami = data.aws_ami.amz-linux2.id
  instance_type = var.instance_type
  key_name = var.insatance_key_pair
  user_data = file("${path.module}/jass.sh")
  #subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.security-group_private.this_security_group_id]
  instance_count = 2
  subnet_ids = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1]
  ]
  tags = local.common_tags
} 