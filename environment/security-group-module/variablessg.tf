# Waleed Khan
# April 11, 2025
# In this file of the Security Group module, the VPC ID input will be imported.

variable "vpc_id" {
  description = "The ID of the VPC in which tf-sg will be created"
  type        = string
}
