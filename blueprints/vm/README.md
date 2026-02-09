<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_compute"></a> [compute](#module\_compute) | app.terraform.io/lykins/compute/aws | 1.0.0 |
| <a name="module_lb"></a> [lb](#module\_lb) | app.terraform.io/lykins/lb/aws | 1.0.0 |
| <a name="module_s3"></a> [s3](#module\_s3) | app.terraform.io/lykins/s3/aws | 1.0.0 |
| <a name="module_target_group"></a> [target\_group](#module\_target\_group) | app.terraform.io/lykins/targetgroup/aws | 1.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compute_create"></a> [compute\_create](#input\_compute\_create) | Whether to create a compute instance | `bool` | `true` | no |
| <a name="input_compute_instance_type"></a> [compute\_instance\_type](#input\_compute\_instance\_type) | The instance type for the compute instance | `string` | `"t2.micro"` | no |
| <a name="input_lb_create"></a> [lb\_create](#input\_lb\_create) | Whether to create a load balancer | `bool` | `true` | no |
| <a name="input_lb_internal"></a> [lb\_internal](#input\_lb\_internal) | Whether the load balancer is internal | `bool` | `true` | no |
| <a name="input_lb_security_groups"></a> [lb\_security\_groups](#input\_lb\_security\_groups) | A list of security group IDs to associate with the load balancer | `list(string)` | `[]` | no |
| <a name="input_lb_subnets_ids"></a> [lb\_subnets\_ids](#input\_lb\_subnets\_ids) | A list of subnet IDs to associate with the load balancer | `list(string)` | `[]` | no |
| <a name="input_lb_type"></a> [lb\_type](#input\_lb\_type) | The type of the load balancer | `string` | `"application"` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | The name of the S3 bucket | `string` | n/a | yes |
| <a name="input_s3_create"></a> [s3\_create](#input\_s3\_create) | Whether to create an S3 bucket | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->