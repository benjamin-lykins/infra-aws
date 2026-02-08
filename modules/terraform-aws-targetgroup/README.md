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
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_port"></a> [port](#input\_port) | The port on which the target is listening | `number` | `80` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The protocol to use for routing traffic to the targets | `string` | `"HTTP"` | no |
| <a name="input_target_group_attachments"></a> [target\_group\_attachments](#input\_target\_group\_attachments) | A map of target IDs to attach to the Target Group | `list(string)` | n/a | yes |
| <a name="input_tg_name"></a> [tg\_name](#input\_tg\_name) | The name of the Target Group | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->