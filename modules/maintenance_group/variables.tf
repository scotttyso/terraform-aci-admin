variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "fw_type" {
  description = "The Firmware Type for the Maintenance Group.  Options are catalog, config, controller, plugin, pluginPackage, switch, or vpod.  Default is switch"
  type        = string
  default     = "switch"
  validation {
    condition     = (can(regexall("^(catalog|config|controller|plugin|pluginPackage|switch|vpod)$", var.fw_type)))
    error_message = "The admin_notify options are are catalog, config, controller, plugin, pluginPackage, switch, or vpod."
  }
}

variable "maintenance_group_type" {
  description = "Specify if this Maintenance Group should be for a range of switches or All Switches.  Options are ALL or range."
  type        = string
  default     = "range"
  validation {
    condition     = (var.maintenance_group_type == "ALL" || var.maintenance_group_type == "range")
    error_message = "The maintenance_group_type options are ALL or range."
  }
}

variable "maintenance_policy_dn" {
  description = "The Distinguished Name for the Maintenance Policy."
  type        = string
}

variable "name" {
  description = "Name for the Maintenance Group."
  type        = string
  default     = "default"
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}
