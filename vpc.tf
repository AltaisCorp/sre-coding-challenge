resource "aws_vpc" "altais-challenge-vpc" {
    cidr_block       = "${var.main_vpc_cidr}"
    instance_tenancy = "default"
    tags = {
        Terraform   = "true"
        Name        = "Altais Challenge VPC"
  }
}