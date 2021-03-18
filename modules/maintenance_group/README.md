# maintenance_group - Maintenance Group Terraform Module - aci_rest

## Usage

```hcl
module "maintenance_group" {

  source = "terraform-aci-admin//modules/maintenance_group"

  # omitted...
}
```

Use this module with ACI 4.X and below to create a Maintenance Group Policy.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "maintMaintGrp"
* Distinguished Name: "uni/fabric/maintgrp-{name}"
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
| [aci_pod_maintenance_group](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/pod_maintenance_group) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| annotation | Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| fw\_type | The Firmware Type for the Maintenance Group.  Options are catalog, config, controller, plugin, pluginPackage, switch, or vpod.  Default is switch | `string` | `"switch"` | no |
| maintenance\_group\_type | Specify if this Maintenance Group should be for a range of switches or All Switches.  Options are ALL or range. | `string` | `"range"` | no |
| maintenance\_policy\_dn | The Distinguished Name for the Maintenance Policy. | `string` | n/a | yes |
| name | Name for the Maintenance Group. | `string` | `"default"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| maintenance\_group | This output will provide the Distinguished Name of the Firmware Group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
