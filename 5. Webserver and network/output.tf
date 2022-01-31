
output "public_instance_ip" {
  value = ["http://${aws_instance.server_instance.public_ip}:80"]
}