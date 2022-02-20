locals {
  environment = "srec"
  name        = "${var.challenge_name}-${var.customer}"
  common_tags = {
    customer    = "altais"
    environment = local.environment
    project     = "altais sre challenge"
    team        = "sre"
    terraform   = true
  }
}