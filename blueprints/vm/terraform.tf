terraform {
  cloud {
    organization = "lykins"
  }
}

provider "aws" {
  region = var.aws_region
}
