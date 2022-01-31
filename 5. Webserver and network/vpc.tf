#resources
resource "aws_vpc" "altais_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "altais_vpc"
  }
}

resource "aws_internet_gateway" "altais_vpc_igw" {
  vpc_id = aws_vpc.altais_vpc.id
  tags = {
    Name = "altais_vpc_igw"
  }
}

resource "aws_subnet" "public_sub" {
  vpc_id                  = aws_vpc.altais_vpc.id
  cidr_block              = var.subnets_cidr
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone
  tags = {
    Name = "altais_vpc_subnet"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.altais_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.altais_vpc_igw.id
  }
  tags = {
    Name = "altais_rt"
  }
}

resource "aws_route_table_association" "sub_association_rt" {
  subnet_id      = aws_subnet.public_sub.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "server_sg" {
  name   = "allow_port_22_80_8080_443"
  vpc_id = aws_vpc.altais_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "altais_sg"
  }
}

resource "aws_key_pair" "server_key" {
  key_name = "public_Key"
  public_key = file(var.public_keypath)
}

resource "aws_instance" "server_instance" {
  ami                    = var.server_ami
  instance_type          = var.micro_instance_type
  subnet_id              = aws_subnet.public_sub.id
  vpc_security_group_ids = [aws_security_group.server_sg.id]
  key_name = aws_key_pair.server_key.key_name
  user_data              = file("httpd.sh")
  tags = {
    Name = "sre_challenge"
  }
}