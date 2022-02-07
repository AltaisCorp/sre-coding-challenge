variable "region" {
    default     = "us-west-1"
    description = "AWS Region variable"
}
variable "main_vpc_cidr" {
    default     = "10.0.0.0/16"
    description = "IP Address that start with 10.0.X.X"
}
variable "public_subnets" {
    default     = "10.0.1.0/24"
    description = "We have 254 IP addresses in this subnet"
}
variable "private_subnets" {
    default     = "10.0.10.0/24"
    description = "We have 254 IP addresses in this subnet"
}
variable "instance_type" {
	default = "t2.micro"	
}
variable "instance_ami" {
    default = "ami-01163e76c844a2129"
}
variable "private_key_path" {
  default = "altais-challenge-key-pair"
}
variable "public_key_path" {
  default = "altais-challenge-key-pair.pub"
}