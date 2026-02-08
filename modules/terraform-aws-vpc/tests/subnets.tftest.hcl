# Tests for subnet configuration

provider "aws" {
  region = "us-east-1"
}

run "no_subnets_configuration" {
  command = plan

  variables {
    name                 = "test-vpc"
    vpc_cidr             = "10.0.0.0/16"
    public_subnet_cidrs  = []
    private_subnet_cidrs = []
  }

  assert {
    condition     = length(aws_subnet.public) == 0
    error_message = "Should have no public subnets"
  }

  assert {
    condition     = length(aws_subnet.private) == 0
    error_message = "Should have no private subnets"
  }

  assert {
    condition     = length(output.public_subnet_ids) == 0
    error_message = "Public subnet IDs output should be empty"
  }

  assert {
    condition     = length(output.private_subnet_ids) == 0
    error_message = "Private subnet IDs output should be empty"
  }
}

run "single_public_subnet" {
  command = plan

  variables {
    name                = "test-vpc"
    vpc_cidr            = "10.0.0.0/16"
    public_subnet_cidrs = ["10.0.1.0/24"]
  }

  assert {
    condition     = length(aws_subnet.public) == 1
    error_message = "Should have exactly one public subnet"
  }

  assert {
    condition     = aws_subnet.public[0].cidr_block == "10.0.1.0/24"
    error_message = "Public subnet CIDR should be 10.0.1.0/24"
  }

  assert {
    condition     = aws_subnet.public[0].map_public_ip_on_launch == true
    error_message = "Public subnet should have map_public_ip_on_launch enabled"
  }
}

run "multiple_subnets_configuration" {
  command = plan

  variables {
    name                 = "test-vpc"
    vpc_cidr             = "10.0.0.0/16"
    public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
  }

  assert {
    condition     = length(aws_subnet.public) == 3
    error_message = "Should have exactly 3 public subnets"
  }

  assert {
    condition     = length(aws_subnet.private) == 2
    error_message = "Should have exactly 2 private subnets"
  }

  assert {
    condition     = length(aws_route_table_association.public) == 3
    error_message = "Should have 3 public route table associations"
  }

  assert {
    condition     = length(aws_route_table_association.private) == 2
    error_message = "Should have 2 private route table associations"
  }
}

run "subnet_vpc_association" {
  command = plan

  variables {
    name                = "test-vpc"
    vpc_cidr            = "10.0.0.0/16"
    public_subnet_cidrs = ["10.0.1.0/24"]
  }

  assert {
    condition     = length(aws_subnet.public) == 1
    error_message = "Should create one public subnet"
  }

  assert {
    condition     = aws_subnet.public[0].cidr_block == "10.0.1.0/24"
    error_message = "Public subnet should have correct CIDR block"
  }
}

run "private_subnets_no_public_ip" {
  command = plan

  variables {
    name                 = "test-vpc"
    vpc_cidr             = "10.0.0.0/16"
    private_subnet_cidrs = ["10.0.10.0/24"]
  }

  assert {
    condition     = aws_subnet.private[0].map_public_ip_on_launch == false
    error_message = "Private subnet should not have map_public_ip_on_launch enabled"
  }
}
