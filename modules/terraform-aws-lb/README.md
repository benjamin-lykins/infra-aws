<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.test](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lb_internal"></a> [lb\_internal](#input\_lb\_internal) | Whether the Load Balancer is internal | `bool` | n/a | yes |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | The name of the Load Balancer | `string` | n/a | yes |
| <a name="input_lb_security_group_ids"></a> [lb\_security\_group\_ids](#input\_lb\_security\_group\_ids) | The security group IDs to associate with the Load Balancer | `list(string)` | n/a | yes |
| <a name="input_lb_subnet_ids"></a> [lb\_subnet\_ids](#input\_lb\_subnet\_ids) | The subnet IDs to associate with the Load Balancer | `list(string)` | n/a | yes |
| <a name="input_lb_type"></a> [lb\_type](#input\_lb\_type) | The type of Load Balancer | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->