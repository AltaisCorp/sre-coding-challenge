variable "name" {
  description = "challenge name"
  default     = "srec"
}

variable "customer" {
  description = "customer name"
  default     = "altaiscorp"
}

variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "AWS Instance Type"
  default     = "t2.micro"
}
