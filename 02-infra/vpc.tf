module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  name                 = var.name
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-west-2a"]
  # private_subnets      = ["10.0.1.0/24"]
  public_subnets       = ["10.0.1.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.common_tags
}
