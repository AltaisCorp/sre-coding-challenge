locals {
  environment = "srec"
  key_name    = "${var.customer}-key"
  common_tags = {
    customer    = "AltaisCorp"
    environment = local.environment
    project     = "sre challenge"
    team        = "sre"
    terraform   = true
  }
}