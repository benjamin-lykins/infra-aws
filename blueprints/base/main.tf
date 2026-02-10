module "vpc" {
  count   = var.vpc_create ? 1 : 0
  source  = "app.terraform.io/lykins/vpc/aws"
  version = "~> 1.0.3"

  vpc_cidr             = var.vpc_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  aws_region           = var.aws_region

}



variable "vpc_create" {
  description = "Whether to create the VPC or not"
  type        = bool
  default     = true

}
