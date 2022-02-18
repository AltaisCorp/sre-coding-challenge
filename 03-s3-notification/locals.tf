locals {
  account_id = data.aws_caller_identity.current.account_id
  environment = "srec"
  name = "${var.challenge_name}-${var.customer}"
  common_tags = {
    customer    = "AltaisCorp"
    environment = local.environment
    project     = "sre challenge"
    team        = "sre"
    terraform   = true
  }
}
