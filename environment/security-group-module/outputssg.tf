# Waleed Khan
# April 11, 2025
# In this file of the Security Group module, the sg-tf ID will be outputted. 

output "security_group_id" {
  description = "ID of tf-sg"
  value       = aws_security_group.sg_tf.id
}
