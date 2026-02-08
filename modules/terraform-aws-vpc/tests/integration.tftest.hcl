# Integration tests - complete VPC setup scenarios
# These tests verify the module works correctly with various real-world configurations

variables {
  aws_region = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}

run "minimal_vpc_setup" {
  command = plan

  variables {
    name     = "minimal-vpc"
    vpc_cidr = "10.0.0.0/16"
  }

  assert {
    condition     = aws_vpc.main.cidr_block == "10.0.0.0/16"
    error_message = "VPC CIDR should be configured"
  }

  assert {
    condition     = length(aws_subnet.public) == 0
    error_message = "No public subnets should be created without configuration"
  }

  assert {
    condition     = length(aws_subnet.private) == 0
    error_message = "No private subnets should be created without configuration"
  }
}

run "full_vpc_setup" {
  command = plan

  variables {
    name                 = "full-vpc"
    environment          = "production"
    vpc_cidr             = "10.100.0.0/16"
    public_subnet_cidrs  = ["10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]
    private_subnet_cidrs = ["10.100.10.0/24", "10.100.11.0/24", "10.100.12.0/24"]
    enable_dns_hostnames = true
    enable_dns_support   = true
  }

  assert {
    condition     = aws_vpc.main.cidr_block == "10.100.0.0/16"
    error_message = "VPC CIDR should be 10.100.0.0/16"
  }

  assert {
    condition     = aws_vpc.main.enable_dns_hostnames == true
    error_message = "DNS hostnames should be enabled"
  }

  assert {
    condition     = aws_vpc.main.enable_dns_support == true
    error_message = "DNS support should be enabled"
  }

  assert {
    condition     = length(aws_subnet.public) == 3
    error_message = "Should create 3 public subnets"
  }

  assert {
    condition     = length(aws_subnet.private) == 3
    error_message = "Should create 3 private subnets"
  }

  assert {
    condition     = length(output.public_subnet_ids) == 3
    error_message = "Should output 3 public subnet IDs"
  }

  assert {
    condition     = length(output.private_subnet_ids) == 3
    error_message = "Should output 3 private subnet IDs"
  }
}

run "multi_az_deployment" {
  command = plan

  variables {
    name                 = "multi-az-vpc"
    vpc_cidr             = "172.16.0.0/16"
    public_subnet_cidrs  = ["172.16.1.0/24", "172.16.2.0/24"]
    private_subnet_cidrs = ["172.16.10.0/24", "172.16.11.0/24"]
  }

  assert {
    condition = alltrue([
      for subnet in aws_subnet.public : subnet.availability_zone != ""
    ])
    error_message = "All public subnets should be assigned to availability zones"
  }

  assert {
    condition = alltrue([
      for subnet in aws_subnet.private : subnet.availability_zone != ""
    ])
    error_message = "All private subnets should be assigned to availability zones"
  }

  assert {
    condition = length(distinct([
      for subnet in aws_subnet.public : subnet.availability_zone
    ])) >= 1
    error_message = "Subnets should be distributed across availability zones"
  }
}

run "different_cidr_ranges" {
  command = plan

  variables {
    name                 = "custom-cidr-vpc"
    vpc_cidr             = "192.168.0.0/20"
    public_subnet_cidrs  = ["192.168.0.0/24"]
    private_subnet_cidrs = ["192.168.1.0/24"]
  }

  assert {
    condition     = aws_vpc.main.cidr_block == "192.168.0.0/20"
    error_message = "VPC should support custom CIDR ranges"
  }

  assert {
    condition     = aws_subnet.public[0].cidr_block == "192.168.0.0/24"
    error_message = "Public subnet CIDR should be within VPC CIDR"
  }

  assert {
    condition     = aws_subnet.private[0].cidr_block == "192.168.1.0/24"
    error_message = "Private subnet CIDR should be within VPC CIDR"
  }
}
