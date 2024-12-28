output "web_security_group_id" {
  description = "ID of the created security group"
  value       = aws_security_group.web-sg.id
  //value = [for security_group in aws_security_group.web-sg : security_group.id]
}