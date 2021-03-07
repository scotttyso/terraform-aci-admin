module "global_security" {
  source = "../modules/security"
  #
  # This module will configure the Global Security Settings under Admin > AAA > Security.
  #
  # Any Variable Not Defined below will use the default values

  web_idle_timeout = 65000
  webtoken_timeout = 9500
}
