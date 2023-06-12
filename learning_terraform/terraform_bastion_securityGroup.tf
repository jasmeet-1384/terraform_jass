module "sg-bastion-public" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"


  name        = "public-sg-jass"
  description = "Security group with SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = module.vpc.vpc_id

  # Ingress Rules & CIDR Block

  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]


  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags         = local.common_tags

}
