variable "encryption_key" {
  type      = string
  sensitive = true
}

variable "oob_mgmt_domain" {
  type    = string
  default = "uni/tn-mgmt/mgmtp-default/oob-default"
}

variable "host1_username" {
  type      = string
  sensitive = true
}

variable "host1_password" {
  type      = string
  sensitive = true
}

variable "host2_ssh_key" {
  type      = string
  sensitive = true
}

variable "host2_ssh_passphrase" {
  type      = string
  sensitive = true
}

variable "key" {
  type      = string
  sensitive = true
}

variable "aciUser" {
  description = "If using a Domain with the User Remember to add apic#[domain]\\<username>"
  type        = string
}


variable "aciPass" {
  description = "NEVER Store your USERNAME or PASSWORD in a Public Repository"
  type        = string
}

variable "aciUrl" {
  description = "This can be the IP or Hostname of the ACI Host you will be configuring"
  type        = string
  default     = "https://brahma-apic1.rich.ciscolabs.com"
}
