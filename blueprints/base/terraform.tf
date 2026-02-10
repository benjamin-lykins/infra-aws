terraform {
  cloud {
    organization = "lykins"
    workspaces {
      project = "bell"
      tags    = ["demo", "vpc"]
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      "workspace" = terraform.workspace
    }
  }
}
