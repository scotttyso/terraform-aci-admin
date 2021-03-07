terraform {
  experiments = [module_variable_optional_attrs]
}

variable "maintenance_node_block" {
  description = "Add Nodes to a Maintenance Group Policy."
  type = map(object({
    annotation           = optional(string)
    description          = optional(string)
    maintenance_group_dn = optional(string)
    node_id_from         = optional(number)
    node_id_to           = optional(number)
    name_alias           = optional(string)
  }))
  default = {
    default = {
      annotation           = ""
      description          = ""
      maintenance_group_dn = ""
      node_id_from         = 201
      node_id_to           = 201 # If the node_id_to is left blank then the node_id_from will be used for the node_id_to as well.
      name_alias           = ""
    }
  }
}

locals {
  maintenance_node_block = {
    for k, v in var.maintenance_node_block : k => {
      annotation           = (v.annotation != null ? v.annotation : "")
      description          = (v.description != null ? v.description : "")
      maintenance_group_dn = (v.maintenance_group_dn != null ? v.maintenance_group_dn : "")
      node_id_from         = coalesce(v.node_id_from, 201)
      node_id_to           = coalesce(v.node_id_to, v.node_id_from, 201)
      name_alias           = (v.name_alias != null ? v.name_alias : "")
    }
  }
}
