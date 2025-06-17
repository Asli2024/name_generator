Name Generator Module

This Terraform module generates standardised names for AWS resources using a combination of a project prefix, environment, resource type, and random suffix. This helps ensure consistency across infrastructure naming conventions.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.2 |

## Resources

| Name | Type |
|------|------|
| [random_string.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name like dev, stage, prod | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Project or team prefix | `string` | n/a | yes |
| <a name="input_random_length"></a> [random\_length](#input\_random\_length) | Length of random suffix | `number` | `6` | no |
| <a name="input_resource"></a> [resource](#input\_resource) | Type of resource, e.g., s3, vpc, alb | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Generated name for the resource |
<!-- END_TF_DOCS -->