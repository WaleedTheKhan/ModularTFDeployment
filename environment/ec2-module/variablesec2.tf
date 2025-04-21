# Waleed Khan
# April 11, 2025
# This is the EC2 module's variables file, where input of subnet IDs and the
# security group ID will be taken.

variable "subnet_ids" {
  description = "List of subnet IDs to launch EC2 instances into"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security Group ID to attach to the EC2 instances"
  type        = string
}