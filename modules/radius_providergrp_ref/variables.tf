variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "description" {
  description = "The Description for the provider in the Provider Group."
  type        = string
  default     = ""
}

variable "hostname" {
  description = "RADIUS security servers are identified on the basis of their host name or IP address.\nNote: If the APIC is configured for in-band management connectivity, choosing an out-of-band management endpoint group for RADIUS access does not take effect. Alternatively, an out-of-band over an in-band management endpoint group can connect a RADIUS server but requires configuring a static route for the RADIUS server."
  type        = string
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "priority" {
  description = "Choose a higher priority, (order), for the server to authenticate first.  The highest priority is 0 and lowest is 17.  Default is 0."
  type        = number
  default     = 0
  validation {
    condition = (
      var.priority >= 0 &&
      var.priority <= 17
    )
    error_message = "The priority should be between 0 and 17."
  }
}

variable "radius_provider_group" {
  description = "The Name for the RADIUS Provider Group."
  type        = string
}
