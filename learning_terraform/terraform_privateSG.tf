module "security-group-private" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"


  name        = local.name
  description = "Security group with HTTP & SSH ports open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = module.vpc.vpc_id

  # Ingress Rules & CIDR Block

  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]


  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags         = local.common_tags

}