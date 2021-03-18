module "login_domain_tacacs" {
  source = "app.terraform.io/Cisco-IST-TigerTeam/admin/aci//modules/login_domain_tacacs"
  #
  # This module will configure a Login Domain for TACACS+.
  #
  # Any Variable Not Defined below will use the default values

  description = "Login Domain TACACS+"
  name        = "TACACS"
}

output "login_domain_tacacs" {
  value = module.login_domain_tacacs
}

module "tacacs_accounting" {
  source = "app.terraform.io/Cisco-IST-TigerTeam/admin/aci//modules/tacacs_accounting"
  #
  # This module will configure a Accounting Group for TACACS+.
  #
  # Any Variable Not Defined below will use the default values

  description = "TACACS+ Accounting Group"
  name        = "TACACS"
}

output "tacacs_accounting" {
  value = module.tacacs_accounting
}

module "tacacs_server1" {
  depends_on = [module.tacacs_accounting, module.login_domain_tacacs]
  source     = "app.terraform.io/Cisco-IST-TigerTeam/admin/aci//modules/tacacs_provider"
  #
  # This module will configure a TACACS+ Provider.
  #
  # Any Variable Not Defined below will use the default values

  accounting_group_dn   = module.tacacs_accounting.accounting_group
  descr_provider        = "TACACS+ Server 1"
  descr_prov_grp        = "TACACS+ Server 1"
  hostname              = "198.19.18.12"
  key                   = var.key
  mgmt_domain_dn        = var.oob_mgmt_domain
  priority              = 1
  tacacs_provider_group = "TACACS"
}

module "tacacs_server2" {
  source = "app.terraform.io/Cisco-IST-TigerTeam/admin/aci//modules/tacacs_provider"
  #
  # This module will configure a TACACS+ Provider.
  #
  # Any Variable Not Defined below will use the default values

  accounting_group_dn   = module.tacacs_accounting.accounting_group
  descr_provider        = "TACACS+ Server 2"
  descr_prov_grp        = "TACACS+ Server 2"
  hostname              = "198.19.18.13"
  key                   = var.key
  mgmt_domain_dn        = var.oob_mgmt_domain
  priority              = 2
  tacacs_provider_group = "TACACS"
}

module "tacacs_source" {
  depends_on = [module.tacacs_accounting]
  source     = "app.terraform.io/Cisco-IST-TigerTeam/admin/aci//modules/tacacs_source"
  #
  # This module will configure a TACACS Source Group for TACACS+.
  #
  # Any Variable Not Defined below will use the default values

  accounting_group_dn = module.tacacs_accounting.accounting_group
  description         = "TACACS+ Source Group"
  name                = "TACACS"
}
