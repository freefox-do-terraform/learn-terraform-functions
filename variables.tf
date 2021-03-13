variable "aws_region" {
  description = "The AWS region to deploy your instance"
  default     = "ap-southeast-2"
}

variable "user_name" {
  description = "The user creating this infrastructure"
  default     = "terraform"
}

variable "user_department" {
  description = "The organization the user belongs to: dev, prod, qa"
  default     = "learn"
}
