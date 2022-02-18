locals {
  aws_region  = "us-west-2"
  environment = "srec"
  name = "${var.challenge_name}-${var.customer}"
  common_tags = {
    client      = "AtlaisCorp"
    environment = local.environment
    project     = "sre challenge"
    team        = "sre"
    terraform   = true
  }
}