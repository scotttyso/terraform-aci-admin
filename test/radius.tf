module "login_domain_radius" {
  source = "../modules/login_domain_radius"
  #
  # This module will configure a Login Domain for RADIUS.
  #
  # Any Variable Not Defined below will use the default values

  description = "Login Domain RADIUS"
  name        = "RADIUS"
}

output "login_domain_radius" {
  value = module.login_domain_radius
}

module "radius_server1" {
  source = "../modules/radius_provider"
  #
  # This module will configure a RADIUS Provider.
  #
  # Any Variable Not Defined below will use the default values

  description    = "RADIUS Server 1"
  hostname       = "198.18.18.12"
  key            = var.key
  mgmt_domain_dn = var.oob_mgmt_domain
}

module "radius_server2" {
  source = "../modules/radius_provider"
  #
  # This module will configure a RADIUS Provider.
  #
  # Any Variable Not Defined below will use the default values

  description    = "RADIUS Server 2"
  hostname       = "198.18.18.13"
  key            = var.key
  mgmt_domain_dn = var.oob_mgmt_domain
}

module "radius_server1_ref" {
  depends_on = [module.login_domain_radius, module.radius_server2]
  source     = "../modules/radius_providergrp_ref"
  #
  # This module will configure a RADIUS Provider.
  #
  # Any Variable Not Defined below will use the default values

  description           = "RADIUS Server 1"
  hostname              = "198.18.18.12"
  priority              = 1
  radius_provider_group = "RADIUS"
}

module "radius_server2_ref" {
  depends_on = [module.login_domain_radius, module.radius_server2]
  source     = "../modules/radius_providergrp_ref"
  #
  # This module will configure a RADIUS Provider.
  #
  # Any Variable Not Defined below will use the default values

  description           = "RADIUS Server 2"
  hostname              = "198.18.18.13"
  priority              = 2
  radius_provider_group = "RADIUS"
}

