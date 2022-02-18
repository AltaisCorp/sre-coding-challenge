data "aws_ami" "amazon_linux_2" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.generated_key.key_name
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = <<-EOF
  #!/bin/sh
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "SRE Challenge for AtlaisCorp" > /var/www/html/index.html
  EOF

  tags = merge(
    local.common_tags,
    {
      Name = "${var.name}-${var.customer}-web"
    }
  )
}

