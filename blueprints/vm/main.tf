
module "compute" {
  count   = var.compute_create ? 1 : 0
  source  = "app.terraform.io/lykins/compute/aws"
  version = "~> 1.0.0"

  instance_type = var.compute_instance_type
}

module "s3" {
  count   = var.s3_create ? 1 : 0
  source  = "app.terraform.io/lykins/s3/aws"
  version = "~> 1.0.0"

  bucket_name = var.s3_bucket_name
}


module "lb" {
  count   = var.lb_create ? 1 : 0
  source  = "app.terraform.io/lykins/lb/aws"
  version = "~> 1.0.0"

  lb_name               = var.lb_name
  lb_internal           = var.lb_internal
  lb_security_group_ids = var.lb_security_groups
  lb_subnet_ids         = var.lb_subnets_ids
  lb_type               = var.lb_type

}

module "target_group" {
  source  = "app.terraform.io/lykins/targetgroup/aws"
  version = "~> 1.0.0"

}
