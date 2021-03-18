module "maintenance_policy_default" {
  source = "../modules/maintenance_policy"
  #
  # This module will create a Firmware Policy under Admin > Firmware.
  #
  # Any Variable Not Defined below will use the default values

  description = "Default Maintenance Policy"
  name        = "Default"
  sw_version  = "simsw-5.1(3e)"
}

output "maintenance_policy_default" {
  value = module.maintenance_policy_default
}

module "maintenance_group_switch_MgA" {
  depends_on = [module.maintenance_policy_default]
  source     = "../modules/maintenance_group"
  #
  # This module will configure a Firmware Group under Admin > Firmware > Node Firmware.
  #
  # Any Variable Not Defined below will use the default values

  maintenance_policy_dn = module.maintenance_policy_default.maintenance_policy
  name                  = "switch_MgA"
}

output "maintenance_group_switch_MgA" {
  value = module.maintenance_group_switch_MgA
}

module "maintenance_group_switch_MgB" {
  depends_on = [module.maintenance_policy_default]
  source     = "../modules/maintenance_group"
  #
  # This module will configure a Firmware Group under Admin > Firmware > Node Firmware.
  #
  # Any Variable Not Defined below will use the default values

  maintenance_policy_dn = module.maintenance_policy_default.maintenance_policy
  name                  = "switch_MgB"
}

output "maintenance_group_switch_MgB" {
  value = module.maintenance_group_switch_MgB
}

module "maintenance_group_switch_MgA_NodeBlk" {
  depends_on = [module.maintenance_group_switch_MgB]
  source     = "../modules/maintenance_node_block"
  #
  # This module will configure a Firmware Group under Admin > Firmware > Node Firmware.
  #
  # Any Variable Not Defined below will use the default values

  maintenance_node_block = {
    "node_101" = {
      description          = "Node 101"
      maintenance_group_dn = module.maintenance_group_switch_MgA.maintenance_group
      node_id_from         = 101
    }
    "node_201" = {
      description          = "Node 201"
      maintenance_group_dn = module.maintenance_group_switch_MgA.maintenance_group
      node_id_from         = 201
    }
  }
}

module "maintenance_group_switch_MgB_NodeBlk" {
  depends_on = [module.maintenance_group_switch_MgB]
  source     = "../modules/maintenance_node_block"
  #
  # This module will configure a Firmware Group under Admin > Firmware > Node Firmware.
  #
  # Any Variable Not Defined below will use the default values

  maintenance_node_block = {
    "node_101" = {
      description          = "Node 202"
      maintenance_group_dn = module.maintenance_group_switch_MgB.maintenance_group
      node_id_from         = 202
    }
  }
}
