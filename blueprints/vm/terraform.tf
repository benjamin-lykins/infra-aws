terraform {
  cloud {
    organization = "lykins"
    workspaces {
      project = "bell"
      tags    = ["demo"]
    }
  }
}

provider "aws" {
  region = var.aws_region
}
