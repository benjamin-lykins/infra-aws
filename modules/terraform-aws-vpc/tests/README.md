# VPC Module Tests

This directory contains Terraform native tests for the AWS VPC module.

## Test Files

### unit.tftest.hcl
Unit tests focusing on:
- CIDR block validation (valid and invalid formats)
- Default variable values
- VPC configuration settings
- Output existence and correctness

### subnets.tftest.hcl
Tests for subnet configuration:
- No subnets scenario
- Single and multiple subnet creation
- Public vs private subnet behavior
- Subnet-VPC associations
- Route table associations

### routing.tftest.hcl
Tests for routing configuration:
- Route table creation
- Internet gateway route configuration
- Public and private route table associations
- Route table per subnet logic

### integration.tftest.hcl
End-to-end integration tests:
- Minimal VPC setup
- Full VPC with multiple subnets
- Multi-AZ deployment
- Different CIDR ranges
- Real-world configuration scenarios

## Running the Tests

### Run all tests
```bash
terraform test
```

### Run a specific test file
```bash
terraform test -filter=tests/unit.tftest.hcl
terraform test -filter=tests/subnets.tftest.hcl
terraform test -filter=tests/routing.tftest.hcl
terraform test -filter=tests/integration.tftest.hcl
```

### Run with verbose output
```bash
terraform test -verbose
```

## Test Coverage

The tests cover:
- ✅ Input validation (CIDR format)
- ✅ Variable defaults
- ✅ VPC configuration
- ✅ Subnet creation and configuration
- ✅ Route tables and associations
- ✅ Internet gateway setup
- ✅ Outputs
- ✅ Multi-AZ deployments
- ✅ Various CIDR ranges
- ✅ Edge cases (no subnets, single subnet, etc.)

## Prerequisites

- Terraform >= 1.6.0 (for native testing support)
- AWS provider credentials configured (for plan/apply tests)

## Notes

- Most tests use `command = plan` to avoid creating real AWS resources
- Tests validate the configuration and expected behavior
- Integration tests can be extended to use `command = apply` for real resource creation and validation
