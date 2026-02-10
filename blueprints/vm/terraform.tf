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
  default_tags {
    tags = merge({
      "workspace" = terraform.workspace
    }, var.default_tags)
  }
}
