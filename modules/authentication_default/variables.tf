variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "description" {
  description = "The Description for Default Authentication realm."
  type        = string
  default     = ""
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "provider_group" {
  description = "The Name for the Provider Group that was created with the Login Domain.  If the realm is local then leave this blank"
  type        = string
  default     = ""
}

variable "realm" {
  description = "The security method for processing authentication and authorization requests. Options are ldap, local, radius, rsa, saml, and tacacs.  The default is local.  The realm allows the protected resources on the associated server to be partitioned into a set of protection spaces, each with its own authentication authorization database. This is an abstract class and cannot be instantiated."
  type        = string
  default     = "local"
  validation {
    condition     = (can(regexall("^(ldap|local|radius|rsa|saml|tacacs)$", var.realm)))
    error_message = "The realm options are ldap, local, radius, rsa, saml, and tacacs."
  }
}

variable "realm_subtype" {
  description = "Realm subtype that can be default or Duo.  Default is default"
  type        = string
  default     = "default"
  validation {
    condition     = (can(regexall("^(default|duo)$", var.realm_subtype)))
    error_message = "The realm SubType options are default or duo."
  }
}
