# Waleed Khan
# April 11, 2025
# In this file of the VPC module, the VPC and Subnet IDs will be outputted.

output "vpc_id" {
  value = aws_vpc.vpc_a.id
}

output "subnet_ids" {
  value = [for subnet in aws_subnet.public : subnet.id]
}
