module "authentication_console" {
  depends_on = [module.login_domain_tacacs]
  source     = "../modules/authentication_console_v4"
  #
  # This module will configure Console Authentication.
  #
  # Any Variable Not Defined below will use the default values

  description    = "Console Authentication"
  provider_group = "TACACS"
  realm          = "tacacs"
}

module "authentication_default" {
  source = "../modules/authentication_default_v4"
  #
  # This module will configure Default Authentication.
  #
  # Any Variable Not Defined below will use the default values

  description = "Default Authentication"
  realm       = "local"
}
