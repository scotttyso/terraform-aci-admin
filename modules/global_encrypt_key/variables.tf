variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "description" {
  description = "A Description for the Global AES Passphrase Ecryption Settings."
  type        = string
  default     = ""
}

variable "encryption_key" {
  description = "The APIC uses a passphrase to generate the AES-256 keys. The passphrase cannot be recovered or read by an ACI administrator or any other user. The AES passphrase is not stored. The APIC uses the AES passphrase to generate the AES key, then discards the passphrase. The same AES-256 passphrase always generates the same AES-256 keys."
  type        = string
  sensitive   = true
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "strong_encrypt" {
  description = "Enables strong encryption on the import or export policy."
  type        = bool
  default     = true
  validation {
    condition     = (var.strong_encrypt == true || var.strong_encrypt == false)
    error_message = "The strong_encrypt options are true or false."
  }
}
