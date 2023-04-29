output "public_ip" {
  value       = [aws_instance.webhost.public_ip]
  description = "Public IP address assigned to the instance"
}