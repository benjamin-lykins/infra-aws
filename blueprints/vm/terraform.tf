terraform {
  cloud {
    organization = "lykins"
  }
}


module "lb" {
  source  = "app.terraform.io/lykins/lb/aws"
  version = "1.0.0"
  # insert required variables here
}

module "target_group" {
  source  = "app.terraform.io/lykins/targetgroup/aws"
  version = "1.0.0"
  # insert required variables here
}


module "compute" {
  source  = "app.terraform.io/lykins/compute/aws"
  version = "1.0.0"
  # insert required variables here
}

