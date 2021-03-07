module "global_encrypt_key" {
  source = "../modules/global_encrypt_key"
  #
  # This module will configure the Global AES Passphrase Ecryption Settings.
  #
  # Any Variable Not Defined below will use the default values
  encryption_key = var.encryption_key
}

/*
  The order of Operation is important below.  The config_export_policy must be last as it will consume
  the triggered scheduler and the remote host/location.
*/
module "Every24Hours" {
  source = "../modules/scheduler"
  #
  # This module will configure a Triggered Schedule and Window to perform the Configuration Export.
  #
  # Any Variable Not Defined below will use the default values

  description    = "Schedule for 12:15 AM every day"
  minute         = 15
  name_scheduler = "Every24Hours"
}

output "Every24Hours" {
  value = module.Every24Hours
}

module "host1" {
  source = "../modules/remote_host"
  #
  # This module will configure a Remote Host to perform the Configuration Export.
  #
  # Any Variable Not Defined below will use the default values

  description    = "Remote Backup Host with Username/Password Authentication"
  mgmt_domain_id = var.oob_mgmt_domain # Note that this must be an existing Attribute... If you want to use inband you must first deploy a inband mgmt epg... It isn't created by default
  remote_host    = "host1.example.com"
  username       = var.host1_username
  password       = var.host1_password
}

output "host1" {
  value = module.host1
}

# module "host2" {
#   source  = "../modules/remote_host"
#   #
#   # This module will configure a Remote Host to perform the Configuration Export.
#   #
#   # Any Variable Not Defined below will use the default values
#
#   auth_type       = "useSshKeyContents"
#   description     = "Remote Backup Host with SSH Key based Authentication"
#   remote_host     = "host2.example.com"
#   remote_port     = 2022
#   remote_path     = "/tmp/backup/"
#   ssh_key         = var.host2_ssh_key
#   ssh_passphrase  = var.host2_ssh_passphrase
# }

# output "host2_dn" {
#   value = module.host2
# }


module "Daily_Backup" {
  depends_on = [module.host1, module.Every24Hours]
  source     = "../modules/config_export_policy"
  #
  # This module will configure a Remote Host to perform the Configuration Export.
  #
  # Any Variable Not Defined below will use the default values

  description = "This is a Policy for Daily Configuration Export"
  remote_host = "host1.example.com"
  scheduler   = "Every24Hours"
}
