variable "admin_state" {
  description = "The admin state of the configuration export policy.  Options are triggered or untriggered.  Default is untriggered, which will wait for the scheduler policy to trigger."
  type        = string
  default     = "untriggered"
  validation {
    condition     = (var.admin_state == "triggered" || var.admin_state == "untriggered")
    error_message = "The admin_state should be equal to either triggered or untriggered."
  }
}

variable "annotation" {
  description = "Annotation for the Window.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "description" {
  description = "A description of the configuration export policy. It can be helpful to include information such as when the policy was created, who created the policy, and how they may be contacted."
  type        = string
  default     = ""
}

variable "format" {
  description = "The data format to be used when exporting the configuration export policy. The format can be:\n  * json\n  * xml\nThe default is json."
  type        = string
  default     = "json"
  validation {
    condition     = (var.format == "json" || var.format == "xml")
    error_message = "The format should be equal to either json or xml."
  }
}

variable "name" {
  description = "The name of the configuration export policy. For ease of reference, include details such as: the format of the export, how often the policy will run, and where the configuration will be exported. The name cannot be changed after the policy has been created."
  type        = string
  default     = "default"
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "remote_host_dn" {
  description = "The Distinguished Name of the remote host for the configuration export policy."
  type        = string
  default     = ""
}

variable "snapshot" {
  description = "Indicates if a snapshot of the configuration export policy is included. The values can be:\n  * true — A snapshot of the configuration export policy is included.\n  * false — A snapshot of the configuration export policy is not included."
  type        = bool
  default     = true
  validation {
    condition     = (var.snapshot == true || var.snapshot == false)
    error_message = "Options for snapshot are true or false."
  }
}

variable "scheduler_dn" {
  description = "The Distinguished Name of the scheduler policy used for running scheduled export jobs for the configuration export policy."
  type        = string
  default     = ""
}

variable "secure_fields" {
  description = "A flag of whether or not to include secure fields in the configuration backup.  This should be true most of the time.  Remember that Global AES Encryption should be configured before enabling this policy to encrypt the configuration export."
  type        = bool
  default     = true
  validation {
    condition     = (var.secure_fields == true || var.secure_fields == false)
    error_message = "Options for secure_fields are true or false."
  }
}

variable "target_dn" {
  description = "The distinguished name of the object to be exported. The policy universe is exported by default. By default leave this blank"
  type        = string
  default     = ""
}
