# Waleed Khan
# April 11, 2025
# In this file of the EC2 module, the EC2s' public IPs will be outputted. 

output "vm_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = [for instance in aws_instance.vm : instance.public_ip]
}
