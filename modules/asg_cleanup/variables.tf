variable "region" {
  description = "AWS region"
  type        = string
}

variable "asg_expiry_days" {
  description = "Days before deleting old ASGs"
  type        = number
  default     = 7
}
