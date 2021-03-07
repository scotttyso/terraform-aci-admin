variable "accounting_group_dn" {
  description = "The Distinguished Name for the TACACS+ Accounting Group."
  type        = string
}

variable "annotation_provider" {
  description = "Annotation for the Provider.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "annotation_prov_grp" {
  description = "Annotation for the provider in the Provider Group.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "auth_protocol" {
  description = "Defines the authentication protocol to use with the TACACS+ server.  Options are chap, mschap, pap.  The default is pap."
  type        = string
  default     = "pap"
  validation {
    condition     = (can(regexall("^(chap|mschap|pap)$", var.auth_protocol)))
    error_message = "The auth_protocol options are chap, mschap, pap."
  }
}

variable "descr_provider" {
  description = "The description of the TACACS+ provider."
  type        = string
  default     = ""
}

variable "descr_prov_grp" {
  description = "The Description for the provider in the Provider Group."
  type        = string
  default     = ""
}

variable "hostname" {
  description = "TACACS+ security servers are identified on the basis of their hostname or IP address.\nNote: If the APIC is configured for in-band management connectivity, choosing an out-of-band management endpoint group for TACACS+ access does not take effect. Alternatively, an out-of-band over an in-band management endpoint group can connect a TACACS+ server but requires configuring a static route for the TACACS+ server."
  type        = string
}

variable "key" {
  description = "The secret text string shared between the device and a specific TACACS+ server."
  type        = string
  sensitive   = true
}

variable "mgmt_domain_dn" {
  description = "The Distinguished Name for the Management Domain.\n Example: \"uni/tn-mgmt/mgmtp-default/oob-default\""
  type        = string
  default     = "uni/tn-mgmt/mgmtp-default/oob-default"
}

variable "monitor" {
  description = "Server Monitoring can be configured through RADIUS, TACACS+, LDAP, and RSA to determine whether the respective AAA servers are active.  Server monitoring is not supported on leaves and spines. If enabled, all the providers will be marked operable on leaves and spines."
  type        = string
  default     = "disabled"
  validation {
    condition = (
      var.monitor == "enabled" ||
      var.monitor == "disabled"
    )
    error_message = "Server monitoring should either be enabled or disabled."
  }
}

variable "monitor_user" {
  description = "Username to use for testing TACACS+ server functionality."
  type        = string
  default     = "default"
}

variable "monitor_pwd" {
  description = "Password to use for testing TACACS+ server functionality."
  type        = string
  sensitive   = true
  default     = ""
}

variable "name_alias_provider" {
  description = "Alias for the TACACS+ Provider.  A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "name_alias_prov_grp" {
  description = "Alias for the TACACS+ Provider Group Reference.  A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
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

variable "port" {
  description = "The service port number for the TACACS+ service. The range is from 1 to 65535. The default is 49."
  type        = number
  default     = 1812
  validation {
    condition = (
      var.port >= 1 &&
      var.port <= 65535
    )
    error_message = "The TACACS+ port should be between 1 and 65535."
  }
}

variable "TACACS_provider_group_dn" {
  description = "The Distinguished Name for the TACACS+ Provider Group."
  type        = string
}

variable "retries" {
  description = "The number of retries when contacting the TACACS+ endpoint. The range is from 0 to 5 retries. The default 1."
  type        = number
  default     = 1
  validation {
    condition = (
      var.retries >= 0 &&
      var.retries <= 5
    )
    error_message = "The retry value should be between 0 and 5."
  }
}

variable "timeout" {
  description = "The timeout for communication with a TACACS+ provider server. The range is from 1 to 60 seconds. The default is 5 seconds. If set to 0, the AAA provider timeout is used."
  type        = number
  default     = 5
  validation {
    condition = (
      var.timeout >= 0 &&
      var.timeout <= 60
    )
    error_message = "The timeout value should be between 0 and 60 seconds."
  }
}
