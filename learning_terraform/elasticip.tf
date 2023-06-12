#Creating Elastic IP
resource "aws_eip" "jass_eip" {
  instance = module.ec2_public.id[0]
  depends_on = [ module.ec2_public ]
  vpc = true
  tags = local.common_tags
}