variable "annotation_logindomain" {
  description = "Annotation for the Login Domain.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "annotation_providergroup" {
  description = "Annotation for the Provider Group.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "description" {
  description = "A Description for the Provider Group."
  type        = string
  default     = ""
}

variable "name" {
  description = "A Name for The Login Domain."
  type        = string
  default     = "TACACS"
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "provider_group" {
  description = "A name for the provider group.  If the provider_group is undefined the name will be the same as the Login Domain."
  type        = string
  default     = ""
}

locals {
  provider_group = coalesce(v.provider_group, v.name)
}
