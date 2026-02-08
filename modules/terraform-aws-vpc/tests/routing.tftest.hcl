# Tests for route tables and routing configuration

provider "aws" {
  region = "us-east-1"
}

run "public_route_table_exists" {
  command = plan

  variables {
    name                = "test-vpc"
    vpc_cidr            = "10.0.0.0/16"
    public_subnet_cidrs = ["10.0.1.0/24"]
  }

  assert {
    condition     = length(aws_route_table_association.public) == 1
    error_message = "Should have one public route table association"
  }
}

run "internet_gateway_route_configured" {
  command = plan

  variables {
    name                = "test-vpc"
    vpc_cidr            = "10.0.0.0/16"
    public_subnet_cidrs = ["10.0.1.0/24"]
  }

  assert {
    condition     = aws_route.public_internet_gateway.destination_cidr_block == "0.0.0.0/0"
    error_message = "Public route should route all traffic (0.0.0.0/0)"
  }
}

run "private_route_tables_per_subnet" {
  command = plan

  variables {
    name                 = "test-vpc"
    vpc_cidr             = "10.0.0.0/16"
    private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
  }

  assert {
    condition     = length(aws_route_table.private) == 2
    error_message = "Should have one private route table per private subnet"
  }

  assert {
    condition     = length(aws_route_table_association.private) == 2
    error_message = "Should have two private route table associations"
  }
}

run "route_table_associations_correct" {
  command = plan

  variables {
    name                 = "test-vpc"
    vpc_cidr             = "10.0.0.0/16"
    public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnet_cidrs = ["10.0.10.0/24"]
  }

  assert {
    condition     = length(aws_route_table_association.public) == 2
    error_message = "Should have two public route table associations"
  }

  assert {
    condition     = length(aws_route_table_association.private) == 1
    error_message = "Should have one private route table association"
  }
}
