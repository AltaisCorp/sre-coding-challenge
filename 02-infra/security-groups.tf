resource "aws_security_group" "web" {
  name        = "${var.name}-allow-web"
  description = "Allow Web & SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  tags = merge(
    local.common_tags,
    {
      Name = "${var.name}-allow-web"
    }
  )

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}