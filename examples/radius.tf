module "login_domain_radius" {
  source = "app.terraform.io/Cisco-IST-TigerTeam/admin/aci//modules/login_domain_radius"
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
  depends_on = [module.login_domain_radius]
  source     = "app.terraform.io/Cisco-IST-TigerTeam/admin/aci//modules/radius_provider"
  #
  # This module will configure a RADIUS Provider.
  #
  # Any Variable Not Defined below will use the default values

  descr_provider        = "RADIUS Server 1"
  descr_prov_grp        = "RADIUS Server 1"
  hostname              = "198.18.18.12"
  key                   = var.key
  priority              = 1
  mgmt_domain_dn        = var.oob_mgmt_domain
  radius_provider_group = "RADIUS"
}

module "radius_server2" {
  depends_on = [module.login_domain_radius]
  source     = "app.terraform.io/Cisco-IST-TigerTeam/admin/aci//modules/radius_provider"
  #
  # This module will configure a RADIUS Provider.
  #
  # Any Variable Not Defined below will use the default values

  descr_provider        = "RADIUS Server 2"
  descr_prov_grp        = "RADIUS Server 2"
  hostname              = "198.18.18.13"
  key                   = var.key
  priority              = 2
  mgmt_domain_dn        = var.oob_mgmt_domain
  radius_provider_group = "RADIUS"
}
