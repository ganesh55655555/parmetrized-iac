variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
}

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(number)
}

variable "instance_name" {
  description = "Instance name"
  type        = string
}
