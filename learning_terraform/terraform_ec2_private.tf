# AWS EC2 Instance Terraform Module
# EC2 Instances that will be created in VPC Private Subnets
module "ec2_private" {
  depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.1.0"

  for_each = toset(["0","1"])

  name          = "${var.environment}-Jass-VM-${eack.key}"
  ami           = data.aws_ami.amz-linux2.id
  instance_type = var.instance_type
  key_name      = var.insatance_key_pair
  user_data     = file("${path.module}/jass.sh")
  vpc_security_group_ids = [module.security-group-private.security_group_id]
  #count                  = var.vm_count

  subnet_id =  element(module.vpc.private_subnets, tonumber(each.key))
    
  tags = local.common_tags
} 

