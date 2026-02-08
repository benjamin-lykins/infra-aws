# Unit tests for VPC module - validation and configuration tests
# These tests validate input validation and configuration without creating real resources

provider "aws" {
  region = "us-east-1"
}

run "invalid_cidr_format" {
  command = plan

  variables {
    name     = "test-vpc"
    vpc_cidr = "invalid-cidr"
  }

  expect_failures = [
    var.vpc_cidr,
  ]
}

run "invalid_cidr_missing_prefix" {
  command = plan

  variables {
    name     = "test-vpc"
    vpc_cidr = "10.0.0.0"
  }

  expect_failures = [
    var.vpc_cidr,
  ]
}

run "valid_cidr_accepts" {
  command = plan

  variables {
    name     = "test-vpc"
    vpc_cidr = "10.0.0.0/16"
  }

  assert {
    condition     = var.vpc_cidr == "10.0.0.0/16"
    error_message = "VPC CIDR should be 10.0.0.0/16"
  }
}

run "default_values_applied" {
  command = plan

  variables {
    name     = "test-vpc"
    vpc_cidr = "172.16.0.0/16"
  }

  assert {
    condition     = var.enable_dns_hostnames == true
    error_message = "DNS hostnames should be enabled by default"
  }

  assert {
    condition     = var.enable_dns_support == true
    error_message = "DNS support should be enabled by default"
  }

  assert {
    condition     = var.environment == "dev"
    error_message = "Environment should default to 'dev'"
  }

  assert {
    condition     = var.aws_region == "us-east-1"
    error_message = "AWS region should default to 'us-east-1'"
  }
}

run "vpc_configuration_correct" {
  command = plan

  variables {
    name                 = "test-vpc"
    vpc_cidr             = "10.0.0.0/16"
    enable_dns_hostnames = false
    enable_dns_support   = false
  }

  assert {
    condition     = aws_vpc.main.cidr_block == "10.0.0.0/16"
    error_message = "VPC CIDR block not set correctly"
  }

  assert {
    condition     = aws_vpc.main.enable_dns_hostnames == false
    error_message = "DNS hostnames should be disabled"
  }

  assert {
    condition     = aws_vpc.main.enable_dns_support == false
    error_message = "DNS support should be disabled"
  }
}

run "outputs_exist" {
  command = plan

  variables {
    name                 = "test-vpc"
    vpc_cidr             = "192.168.0.0/16"
    public_subnet_cidrs  = ["192.168.1.0/24"]
    private_subnet_cidrs = ["192.168.10.0/24"]
  }

  assert {
    condition     = output.vpc_cidr == "192.168.0.0/16"
    error_message = "VPC CIDR output should match input"
  }

  assert {
    condition     = length(output.public_subnet_ids) == 1
    error_message = "Should output 1 public subnet ID"
  }

  assert {
    condition     = length(output.private_subnet_ids) == 1
    error_message = "Should output 1 private subnet ID"
  }
}
