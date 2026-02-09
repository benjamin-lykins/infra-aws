module "vpc" {
  count   = var.vpc_create ? 1 : 0
  source  = "app.terraform.io/lykins/vpc/aws"
  version = "~> 1.0.1"

  name                 = var.name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  environment          = var.environment
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}



