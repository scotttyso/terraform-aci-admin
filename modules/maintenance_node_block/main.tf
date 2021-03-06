#------------------------------------------
# Add Nodes Blocks to Maintenance Group(s)
#------------------------------------------

/*
API Information:
 - Class: "fabricNodeBlk"
 - Distinguished Name: "uni/fabric/maintgrp-{Maintenance Group Name}/nodeblk-{Block Name}"
GUI Location:
 - Admin > Firmware > Nodes > {Maintenance Group Name}
*/
resource "aci_rest" "maintenance_node_block" {
  for_each   = local.maintenance_node_block
  path       = "/api/node/mo/${each.value["maintenance_group_dn"]}/nodeblk-blk${each.value["node_id_from"]}-${each.value["node_id_to"]}.json"
  class_name = "fabricNodeBlk"
  payload    = <<EOF
{
    "fabricNodeBlk": {
        "attributes": {
            "dn": "${each.value["maintenance_group_dn"]}/nodeblk-blk${each.value["node_id_from"]}-${each.value["node_id_to"]}",
            "from_": "${each.value["node_id_from"]}",
            "name": "blk${each.value["node_id_from"]}-${each.value["node_id_to"]}",
            "to_": "${each.value["node_id_to"]}",
        }
    }
}
	EOF
}

