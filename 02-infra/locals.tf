locals {
  environment = "srec"
  key_name    = "${var.customer}-key"
  common_tags = {
    customer    = "altais"
    environment = local.environment
    project     = "altais sre challenge"
    team        = "sre"
    terraform   = true
  }
}