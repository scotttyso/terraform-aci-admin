# firmware_policy - Firmware Policy Terraform Module - aci_rest

## Usage

```hcl
module "firmware_policy" {

  source = "terraform-aci-admin//modules/firmware_policy"

  # omitted...
}
```

Use this module with ACI 5.X and above to create a Firmware Policy.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "firmwareFwP"
* Distinguished Name: "uni/fabric/fwpol-{name}"
* GUI Location: This is not available from the UI

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
| [aci_firmware_policy](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/firmware_policy) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| annotation | Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| description | A description for the Firmware Policy. | `string` | `""` | no |
| effective\_on\_reboot | A property that indicates if the selected firmware version will be active after reboot. The firmware must be effective on an unplanned reboot before the scheduled maintenance operation.  Options are yes or no.  Default is no. | `string` | `"no"` | no |
| ignore\_compatability | A property for specifying whether compatibility checks should be ignored when applying the firmware policy.  Options are yes or no.  Default is no. | `string` | `"no"` | no |
| name | The firmware policy name. | `string` | `"default"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| sw\_version | The firmware version. | `string` | `"n9000-14.2(5k)"` | no |
| version\_check\_override | A property for specifying whether the firmware upgrade should be triggered or not.  Options are trigger, trigger-immediate or untriggered.  Default is untriggered. | `string` | `"untriggered"` | no |

## Outputs

| Name | Description |
|------|-------------|
| firmware\_policy | This output will provide the Distinguished Name of the Firmware Policy. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
