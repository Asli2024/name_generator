resource "random_string" "suffix" {
  length  = var.random_length
  special = false
  upper   = false
}

locals {
  generated_name = join("-", [
    var.prefix,
    var.environment,
    var.resource,
    random_string.suffix.result
  ])
}
