variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "my_ip" {
  description = "IP address allowed for SSH"
  type        = string
}