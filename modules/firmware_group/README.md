# firmware_group - Firmware Group Terraform Module - aci_rest

## Usage

```hcl
module "firmware_group" {

  source = "terraform-aci-access//modules/firmware_group"

  # omitted...
}
```

Use this module with ACI 5.X and above to create a Firmware Group Policy.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "firmwareFwGrp"
* Distinguished Name: "uni/fabric/fwgrp-{name}"
* GUI Location: Admin > Firmware > Nodes > Actions > Create Update Group

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
| [aci_firmware_group](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/firmware_group) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| annotation | Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| description | The Description for the Node Firmware Group. | `string` | `""` | no |
| firmware\_group\_type | Specify if this Firmware Group should be for a range of switches or All Switches.  Options are ALL or range. | `string` | `"range"` | no |
| firmware\_policy\_dn | The Distinguished Name for the Firmware Policy. | `string` | n/a | yes |
| name | Name for the Firmware Group. | `string` | `"default"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| firmware\_group | This output will provide the Distinguished Name of the Firmware Group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
