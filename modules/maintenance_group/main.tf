#----------------------------------------------
# Create a Pod Maintenance Group
#----------------------------------------------

/*
API Information:
 - Class: "firmwareFwGrp"
 - Distinguished Name: "uni/fabric/fwgrp-{name}"
GUI Location:
 - Admin > Firmware > Nodes > Actions > Create Update Group
*/
resource "aci_pod_maintenance_group" "maintenance_group" {
  annotation                 = var.annotation
  fwtype                     = var.fw_type
  name                       = var.name
  name_alias                 = var.name_alias
  pod_maintenance_group_type = var.maintenance_group_type
  relation_maint_rs_mgrpp    = var.maintenance_policy_dn
}
