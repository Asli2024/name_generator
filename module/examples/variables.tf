variable "prefix" {
  description = "Project or team prefix"
  type        = string
}

variable "environment" {
  description = "Environment name like dev, stage, prod"
  type        = string
}

variable "random_length" {
  description = "Length of random suffix"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
