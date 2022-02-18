locals {
  environment = "srec"
  name        = "${var.challenge_name}-${var.customer}"
  common_tags = {
    customer    = "AtlaisCorp"
    environment = local.environment
    project     = "AtlaisCorp sre challenge"
    team        = "sre"
    terraform   = true
  }
}