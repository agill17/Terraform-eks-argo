module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.6.0"

  name                 = var.vpc.name
  cidr                 = var.vpc.cidr
  azs                  = var.vpc.azs
  private_subnets      = var.vpc.privateSubnetIps
  public_subnets       = var.vpc.publicSubnetIps
  enable_nat_gateway   = var.vpc.nat
  single_nat_gateway   = false
  enable_dns_hostnames = false

  tags = local.vpcTags
  public_subnet_tags = local.vpcTags
  private_subnet_tags = local.vpcTags
}