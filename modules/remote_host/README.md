# remote_host - Configuration Import/Export Remote Location Terraform Module - aci_rest

## Usage

```hcl
module "remote_host" {

  source = "terraform-aci-access//modules/remote_host"

  # omitted...
}
```

This module will Create a Remote Host for a Configuration Import/Export Policy.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "fileRemotePath"
* Distinguished Name: "uni/fabric/path-${remote_host}"
* GUI Location: Admin > Import/Export > Remote Locations:${remote_host}

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
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

No Modules.

## Resources

| Name |
|------|
| [aci_rest](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/rest) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| annotation | Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| auth\_type | The authentication type to be used to authenticate the user. The authentication type can be:<br>  * usePassword<br>  * useSshKeyContents | `string` | `"usePassword"` | no |
| description | A Description for the Remote Host. | `string` | `""` | no |
| mgmt\_domain\_id | The Distinguished Name for the Management Domain.<br> Example: "uni/tn-mgmt/mgmtp-default/oob-default" | `string` | `"uni/tn-mgmt/mgmtp-default/oob-default"` | no |
| name | A Name for The Remote Location Policy.  If this is not defined the remote\_host value will be used for the name. | `string` | `""` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| password | The password to be used to transfer data to the destination. Only required for usePassword auth\_type. | `string` | `""` | no |
| protocol | The transfer protocol to be used for data export. The protocols can be: ftp, scp or sftp. | `string` | `"sftp"` | no |
| remote\_host | The host name or IP for export destination. | `string` | n/a | yes |
| remote\_path | The path where data will reside in the destination; in example /tmp. | `string` | `"/tmp"` | no |
| remote\_port | The port for the data export destination. | `number` | `22` | no |
| ssh\_key | (Only for the Use SSH Public/Private Files authentication type) The contents of the SSH public or private key that is used to authenticate the user. | `string` | `""` | no |
| ssh\_passphrase | (Only for the Use SSH Public/Private Files authentication type) The SSH key passphrase that is used to authenticate the user. | `string` | `""` | no |
| username | The username to be used to transfer data to the destination. Only required for usePassword auth\_type. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| remote\_host | This output will provide the Distinguished Name of the Remote Host Policy. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
