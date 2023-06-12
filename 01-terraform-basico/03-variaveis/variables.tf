variable "environment" {
  type        = string
  description = ""
}

variable "aws_region" {
  type        = string
  description = ""
}

variable "aws_profile" {
  type        = string
  description = ""
}

variable "instance_ami" {
  type        = string
  description = ""
}

variable "instance_type" {
  type        = string
  description = ""
}

variable "instance_tag" {
  type        = map(string)
  description = ""
  default = {
    Name    = "Amazon_Linux"
    Project = "Curso AWS com Terraform"
  }
}
