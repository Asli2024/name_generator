variable "prefix" {
  description = "Project or team prefix"
  type        = string
}

variable "environment" {
  description = "Environment name like dev, stage, prod"
  type        = string
}

variable "resource" {
  description = "Type of resource, e.g., s3, vpc, alb"
  type        = string
}

variable "add_random" {
  description = "Whether to add random suffix"
  type        = bool
  default     = true
}

variable "random_length" {
  description = "Length of random suffix"
  type        = number
  default     = 6
}
