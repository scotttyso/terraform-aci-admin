variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "auth_type" {
  description = "The authentication type to be used to authenticate the user. The authentication type can be:\n  * usePassword\n  * useSshKeyContents"
  type        = string
  default     = "usePassword"
  validation {
    condition     = (var.auth_type == "usePassword" || var.auth_type == "useSshKeyContents")
    error_message = "Options are usePassword or useSshKeyContents for auth_type."
  }
}

variable "description" {
  description = "A Description for the Remote Host."
  type        = string
  default     = ""
}

variable "mgmt_domain_id" {
  description = "The Distinguished Name for the Management Domain.\n Example: \"uni/tn-mgmt/mgmtp-default/oob-default\""
  type        = string
  default     = ""
}

variable "name" {
  description = "A Name for The destination for data export.  If this is not defined the remote_host value will be used for the name."
  type        = string
  default     = ""
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "protocol" {
  description = "The transfer protocol to be used for data export. The protocols can be: ftp, scp or sftp."
  type        = string
  default     = "sftp"
  validation {
    condition     = (var.protocol == "ftp" || var.protocol == "scp" || var.protocol == "sftp")
    error_message = "Options are ftp, scp, or sftp for auth_type."
  }
}

variable "remote_host" {
  description = "The host name or IP for export destination."
  type        = string
}

variable "remote_path" {
  description = "The path where data will reside in the destination; in example /tmp."
  type        = string
  default     = "/tmp"
}

variable "remote_port" {
  description = "The port for the data export destination."
  type        = number
  default     = 22
  validation {
    condition = (
      var.remote_port >= 1 &&
      var.remote_port <= 65535
    )
    error_message = "The port should be between 1 and 65535 for the remote_port."
  }
}

variable "ssh_key" {
  description = "(Only for the Use SSH Public/Private Files authentication type) The contents of the SSH public or private key that is used to authenticate the user."
  type        = string
  sensitive   = true
  default     = ""
}

variable "ssh_passphrase" {
  description = "(Only for the Use SSH Public/Private Files authentication type) The SSH key passphrase that is used to authenticate the user."
  type        = string
  sensitive   = true
  default     = ""
}

variable "username" {
  description = "The username to be used to transfer data to the destination. Only required for usePassword auth_type."
  type        = string
  sensitive   = true
  default     = ""
}

variable "password" {
  description = "The password to be used to transfer data to the destination. Only required for usePassword auth_type."
  type        = string
  sensitive   = true
  default     = ""
}

locals {
  name = coalesce(v.name, v.remote_host)
}
