variable "aws__region" {
  default = "us-west-1"
}

variable "availability_zone" {
  default = "us-west-1a"
}

variable "vpc_cidr" {
  description = "Altais_VPC"
  default     = "172.16.0.0/16"
}

variable "subnets_cidr" {
  default = "172.16.1.0/24"
}

variable "micro_instance_type" {
  default = "t2.micro"
}

variable "server_ami" {
  default = "ami-01163e76c844a2129"
}

variable "public_keypath" {
  default     = "/home/kop/altair-sre-chanllenge/altais_key.pub"
}