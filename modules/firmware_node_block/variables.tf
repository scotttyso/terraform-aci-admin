terraform {
  experiments = [module_variable_optional_attrs]
}

variable "node_firmware_block" {
  description = "Add Nodes to a Firmware Group Policy."
  type = map(object({
    annotation        = optional(string)
    description       = optional(string)
    firmware_group_dn = optional(string)
    name_alias        = optional(string)
    node_id_from      = optional(number)
    node_id_to        = optional(number)
  }))
  default = {
    default = {
      annotation        = ""
      description       = ""
      firmware_group_dn = ""
      name_alias        = ""
      node_id_from      = 201
      node_id_to        = 201 # If the node_id_to is left blank then the node_id_from will be used for the node_id_to as well.
    }
  }
}

locals {
  node_firmware_block = {
    for k, v in var.node_firmware_block : k => {
      annotation        = (v.annotation != null ? v.annotation : "")
      description       = (v.description != null ? v.description : "")
      firmware_group_dn = (v.firmware_group_dn != null ? v.firmware_group_dn : "")
      name_alias        = (v.name_alias != null ? v.name_alias : "")
      node_id_from      = coalesce(v.node_id_from, 201)
      node_id_to        = coalesce(v.node_id_to, v.node_id_from, 201)
    }
  }
}
