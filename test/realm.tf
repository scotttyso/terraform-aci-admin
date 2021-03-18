#---------------------------------------------------------------------
# When using this module if you are using ACI 4.X use the _v4 modules
# When using this module for ACI 5.X use the _v5 modules
#---------------------------------------------------------------------

module "authentication_console" {
  depends_on = [module.login_domain_tacacs]
  source     = "../modules/authentication_console_v5"
  #
  # This module will configure Console Authentication.
  #
  # Any Variable Not Defined below will use the default values

  description    = "Console Authentication"
  provider_group = "TACACS"
  realm          = "tacacs"
}

module "authentication_default" {
  source = "../modules/authentication_default_v5"
  #
  # This module will configure Default Authentication.
  #
  # Any Variable Not Defined below will use the default values

  description = "Default Authentication"
  realm       = "local"
}
