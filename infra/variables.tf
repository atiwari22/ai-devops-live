variable "aws_region" {
  description = "AWS region. This project is only deployed in ap-south-1."
  type        = string
  default     = "ap-south-1"

  validation {
    condition     = var.aws_region == "ap-south-1"
    error_message = "aws_region must be ap-south-1."
  }
}

variable "project_name" {
  description = "Project tag and name prefix."
  type        = string
  default     = "ai-devops-live"
}

variable "owner" {
  description = "owner tag. Value is a handle, not a secret."
  type        = string
  default     = "abhtiwar"
}

variable "environment" {
  description = "Env tag."
  type        = string
  default     = "demo"
}
