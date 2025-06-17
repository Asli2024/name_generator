# Name Generator Module

This Terraform module generates standardized names for AWS resources using a combination of a project prefix, environment, resource type, and random suffix. This ensures consistency across infrastructure naming conventions and avoids naming conflicts.

## Features
- Combines project prefix, environment, resource type, and random suffix.
- Ensures consistent naming conventions across AWS resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0 |

## Inputs

| Name              | Description                                  | Type     | Default | Required |
|-------------------|----------------------------------------------|----------|---------|----------|
| `prefix`          | Project prefix for the resource name         | `string` | n/a     | yes      |
| `environment`     | Environment name (e.g., dev, prod)           | `string` | n/a     | yes      |
| `resource`        | Resource type (e.g., server, database)       | `string` | n/a     | yes      |
| `random_length`   | Length of the random suffix                  | `number` | `8`     | no       |
| `add_random`      | Whether to include a random suffix           | `bool`   | `true`  | no       |

## Outputs

| Name              | Description                                  |
|-------------------|----------------------------------------------|
| `generated_name`  | The generated resource name                  |

## Usage Example

```terraform
module "name_generator" {
  source        = "./modules/name-generator"
  prefix        = "app"
  environment   = "dev"
  resource      = "ec2"
  random_length = 6
  add_random    = true
}

output "resource_name" {
  value = module.name_generator.generated_name
}