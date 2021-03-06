# global_encrypt_key - Global AES Passphrase Ecryption Settings Terraform Module - aci_rest

## Usage

```hcl
module "global_encrypt_key" {

  source = "terraform-aci-access//modules/global_encrypt_key"

  # omitted...
}
```

This module will Configure the Global AES Passphrase Ecryption Settings.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "pkiExportEncryptionKey"
* Distinguished Name: "uni/exportcryptkey"
* GUI Location: System > System Settings > Global AES Passphrase Ecryption Settings

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
| description | A Description for the Global AES Passphrase Ecryption Settings. | `string` | `""` | no |
| encryption\_key | The APIC uses a passphrase to generate the AES-256 keys. The passphrase cannot be recovered or read by an ACI administrator or any other user. The AES passphrase is not stored. The APIC uses the AES passphrase to generate the AES key, then discards the passphrase. The same AES-256 passphrase always generates the same AES-256 keys. | `string` | n/a | yes |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| strong\_encrypt | Enables strong encryption on the import or export policy. | `bool` | `true` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
