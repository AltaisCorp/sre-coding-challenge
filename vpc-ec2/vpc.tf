resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

}

resource "aws_subnet" "private_1" {
  vpc_id = aws_vpc.main.id

  cidr_block        = cidrsubnet(var.vpc_cidr_block, 2, 1)
  availability_zone = var.az-id-1
}

resource "aws_subnet" "private_2" {
  vpc_id = aws_vpc.main.id

  cidr_block        = cidrsubnet(var.vpc_cidr_block, 1, 1)
  availability_zone = var.az-id-2
}
