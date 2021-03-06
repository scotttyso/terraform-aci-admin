#----------------------------------------------
# Create a VPC Domain Pair
#----------------------------------------------

/*
API Information:
 - Class: "firmwareFwGrp"
 - Distinguished Name: "uni/fabric/fwgrp-{name}"
GUI Location:
 - Admin > Firmware > Nodes > Actions > Create Update Group
*/
resource "aci_firmware_group" "firmware_group" {
  annotation                  = var.annotation
  name                        = var.name
  name_alias                  = var.name_alias
  firmware_group_type         = var.firmware_group_type
  relation_firmware_rs_fwgrpp = var.firmware_policy_dn
}
