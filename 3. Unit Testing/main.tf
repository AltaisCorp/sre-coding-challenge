#terraform block
terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#providers
provider "aws" {
  region = "us-west-1"
}

# Deploy an EC2 Instance.
resource "aws_instance" "example" {
  # Run an Ubuntu 18.04 AMI on the EC2 instance.
  ami                    = "ami-0e472ba40eb589f49"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  # When the instance boots, start a web server on port 8080 that responds with "Hello, World!".
  user_data = <<EOF
#!/bin/bash
yum update -y
yum -y install httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>AltaisSRE-Coding-Challenge</h1>" > /var/www/html/index.html
EOF
}

# Allow the instance to receive requests on port 8080.
resource "aws_security_group" "instance" {
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Output the instance's public IP address.
output "public_ip" {
  value = aws_instance.example.public_ip
}