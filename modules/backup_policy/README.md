# backup_policy - Create a Configuration Export Policy Terraform Module - aci_rest

## Usage

```hcl
module "backup_policy" {

  source = "terraform-aci-access//modules/backup_policy"

  # omitted...
}
```

This module will Create the Configuration Export Policy to backup the configuration to a remote host.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "configExportP"
* Distinguished Name: "uni/fabric/configexp-{name}"
* GUI Location: Admin > Import/Export > Export Policies > Configuration > {name}

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
| admin\_state | The admin state of the configuration export policy.  Options are triggered or untriggered.  Default is untriggered, which will wait for the scheduler policy to trigger. | `string` | `"untriggered"` | no |
| annotation | Annotation for the Window.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| description | A description of the configuration export policy. It can be helpful to include information such as when the policy was created, who created the policy, and how they may be contacted. | `string` | `""` | no |
| format | The data format to be used when exporting the configuration export policy. The format can be:<br>  * json<br>  * xml<br>The default is json. | `string` | `"json"` | no |
| name | The name of the configuration export policy. For ease of reference, include details such as: the format of the export, how often the policy will run, and where the configuration will be exported. The name cannot be changed after the policy has been created. | `string` | `"default"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| remote\_host\_dn | The Distinguished Name of the remote host for the configuration export policy. | `string` | n/a | yes |
| scheduler\_dn | The Distinguished Name of the scheduler policy used for running scheduled export jobs for the configuration export policy. | `string` | n/a | yes |
| secure\_fields | A flag of whether or not to include secure fields in the configuration backup.  This should be true most of the time.  Remember that Global AES Encryption should be configured before enabling this policy to encrypt the configuration export. | `bool` | `true` | no |
| snapshot | Indicates if a snapshot of the configuration export policy is included. The values can be:<br>  * true — A snapshot of the configuration export policy is included.<br>  * false — A snapshot of the configuration export policy is not included. | `bool` | `true` | no |
| target\_dn | The distinguished name of the object to be exported. The policy universe is exported by default. By default leave this blank | `string` | `""` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
