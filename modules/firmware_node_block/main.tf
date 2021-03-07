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
resource "aci_rest" "node_firmware_block" {
  for_each   = local.node_firmware_block
  path       = "/api/node/mo/${each.value["firmware_group_dn"]}/nodeblk-blk${each.value["node_id_from"]}-${each.value["node_id_to"]}.json"
  class_name = "fabricNodeBlk"
  payload    = <<EOF
{
  "fabricNodeBlk": {
    "attributes": {
      "annotation": "${each.value["annotation"]}",
      "descr": "${each.value["description"]}",
      "dn": "${each.value["firmware_group_dn"]}/nodeblk-blk${each.value["node_id_from"]}-${each.value["node_id_to"]}",
      "from_": "${each.value["node_id_from"]}",
      "name": "blk${each.value["node_id_from"]}-${each.value["node_id_to"]}",
      "nameAlias": "${each.value["name_alias"]}",
      "to_": "${each.value["node_id_to"]}",
    },
    "children": []
  }
}
  EOF
}
