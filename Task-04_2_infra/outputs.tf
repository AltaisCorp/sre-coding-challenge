output "web_instance_ip" {
  value = aws_instance.web.public_ip
}

output "public_subnet" {
  value = module.vpc.public_subnets[0]
}