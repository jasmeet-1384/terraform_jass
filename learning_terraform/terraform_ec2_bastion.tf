# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_public" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "5.1.0"

  name = "${var.environment}-Jass-BastionHost"
  ami = data.aws_ami.amz-linux2.id
  instance_type = var.instance_type
  key_name = var.insatance_key_pair
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.sg-bastion_public.this_security_group_id]
  tags = local.common_tags
}