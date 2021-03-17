#------------------------------------------
# Add Nodes Blocks to Firmware Group(s)
#------------------------------------------

/*
API Information:
 - Class: "fabricNodeBlk"
 - Distinguished Name: "uni/fabric/fwgrp-{Firmware Group Name}/nodeblk-{name}"
GUI Location:
 - Admin > Firmware > Nodes > {Firmware Group Name}
*/
resource "aci_node_block_firmware" "example" {
  for_each          = local.firmware_node_block
  annotation        = each.value["annotation"]
  firmware_group_dn = each.value["firmware_group_dn"]
  from_             = each.value["node_id_from"]
  name              = "blk${each.value["node_id_from"]}-${each.value["node_id_to"]}"
  name_alias        = each.value["name_alias"]
  to_               = each.value["node_id_to"]
}
