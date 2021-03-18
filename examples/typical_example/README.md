# terraform-aci-admin - ACI Terraform Module to Automate Admin Tasks

The terraform-aci-admin module is made of serveral sub-modules to help to automate the task of deploying ACI Fabric Admin tasks.

This folder has examples for each of the sub-modules and how you can use this module for deployment but can be customized for your environment.

This module is self contained except for secure Variables. There are two ways to add sensitive variables to the system as environemnt variables if you are using this script with Terraform OSS.

In Example:
export TF_VAR_encryption_key='dummy_encryption_key'
export TF_VAR_host1_username='dummy_user'
export TF_VAR_host1_password='dummy_pwd'
export TF_VAR_host2_ssh_passphrase='dummy_passphrase'
export TF_VAR_host2_ssh_key='../../dummy_secret.key'
export TF_VAR_key='dummy_key'

The TF_VAR_ is an indicator to terraform that the varialble "encryption_key" is related to the variables defined in the variables.tf file.

The second option if you are using this module with Terraform Cloud is to save these variables as sensitive variables within the workspace.  This is the more secure method and is recommended but is only an avaialble option if you are using Terraform Cloud.

The third option is to use Vault to secure your secrets and can be used with Terraform OSS or Terraform Cloud but is beyond the scope of the simple use of this module.

## Requirements

| Name | Version |
|------|---------|
| terraform | > 0.14 |
| aci | >= 0.5.2 |

## Providers

| Name | Version |
|------|---------|
| aci | >= 0.5.2 |

## Modules

* authentication_console_v4
* authentication_console_v5
* authentication_default_v4
* authentication_default_v5
* config_export_policy
* firmware_group
* firmware_node_block
* firmware_policy
* global_encrypt_key
* login_domain_duo
* login_domain_radius
* login_domain_tacacs
* maintenance_group
* maintenance_node_block
* maintenance_policy
* radius_duo_provider
* radius_provider
* remote_host
* scheduler
* security
* tacacs_accounting
* tacacs_provider
* tacacs_source

## Resources

Refer to the Individual Sub-Modules for resource references.

## Inputs/Outputs

Refer to the Individual Sub-Modules for resource references.
