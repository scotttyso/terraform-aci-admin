#----------------------------------------------
# Create a Firmware Group Policy
#----------------------------------------------

/*
API Information:
 - Class: "firmwareFwP"
 - Distinguished Name: "uni/fabric/fwpol-{name}"
GUI Location:
 - This is not available from the UI
*/
resource "aci_firmware_policy" "firmware_policy" {
  annotation             = var.annotation
  effective_on_reboot    = var.effective_on_reboot
  ignore_compat          = var.ignore_compatability
  name                   = var.name
  name_alias             = var.name_alias
  version                = var.sw_version
  version_check_override = var.version_check_override
}
