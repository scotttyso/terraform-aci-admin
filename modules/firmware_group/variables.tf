variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "description" {
  description = "The Description for the Node Firmware Group."
  type        = string
  default     = ""
}

variable "firmware_group_type" {
  description = "Specify if this Firmware Group should be for a range of switches or All Switches.  Options are ALL or range."
  type        = string
  default     = "range"
  validation {
    condition     = (var.firmware_group_type == "ALL" || var.firmware_group_type == "range")
    error_message = "The firmware_group_type options are ALL or range."
  }
}

variable "firmware_policy_dn" {
  description = "The Distinguished Name for the Firmware Policy."
  type        = string
}

variable "name" {
  description = "Name for the Firmware Group."
  type        = string
  default     = "default"
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}
