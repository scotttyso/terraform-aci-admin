#----------------------------------------------
# Create a Firmware Group Policy
#----------------------------------------------

/*
API Information:
 - Class: "maintMaintP"
 - Distinguished Name: "uni/fabric/maintpol-{name}"
GUI Location:
 - This is not available from the UI
*/
resource "aci_maintenance_policy" "maintenance_policy" {
  admin_st               = var.admin_state
  annotation             = var.annotation
  graceful               = var.graceful
  ignore_compat          = var.ignore_compatability
  name                   = var.name
  name_alias             = var.name_alias
  notif_cond             = var.admin_notify
  run_mode               = var.run_mode
  version                = var.sw_version
  version_check_override = var.version_check_override
}
