variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "asg_expiry_days" {
  description = "Days before ASG deletion"
  type        = number
  default     = 7
}
