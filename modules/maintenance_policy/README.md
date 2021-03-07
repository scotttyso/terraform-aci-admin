# maintenance_policy - Maintenance Policy Terraform Module - aci_rest

## Usage

```hcl
module "maintenance_policy" {

  source = "terraform-aci-access//modules/maintenance_policy"

  # omitted...
}
```

Use this module with ACI 4.X and below to create a Maintenance Policy.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "maintMaintP"
* Distinguished Name: "uni/fabric/maintpol-{name}"
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
| [aci_maintenance_policy](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/maintenance_policy) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_notify | Maintenance Policy Admin Notification.  Options are notifyAlwaysBetweenSets, notifyNever, or notifyOnlyOnFailures.  Default is notifyOnlyOnFailures | `string` | `"notifyOnlyOnFailures"` | no |
| admin\_state | Maintenance Policy Admin State.  Options are triggered or untriggered.  Default is untriggered | `string` | `"untriggered"` | no |
| annotation | Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| description | A description for the Maintance Policy. | `string` | `""` | no |
| graceful | This option will enable Graceful Insertion and Removal mode.  Options are yes or no.  Default is no. | `string` | `"no"` | no |
| ignore\_compatability | A property for specifying whether compatibility checks should be ignored when applying the firmware policy.  Options are yes or no.  Default is no. | `string` | `"no"` | no |
| name | The Maintenance Policy name. | `string` | `"default"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| run\_mode | Maintenance Policy Admin Notification.  Options are pauseAlwaysBetweenSets, pauseNever, or pauseOnlyOnFailures.  Default is pauseOnlyOnFailures | `string` | `"pauseOnlyOnFailures"` | no |
| sw\_version | The firmware version. | `string` | `"n9000-14.2(5k)"` | no |
| version\_check\_override | A property for specifying whether the firmware upgrade should be triggered or not.  Options are trigger, trigger-immediate, triggered or untriggered.  Default is untriggered. | `string` | `"untriggered"` | no |

## Outputs

| Name | Description |
|------|-------------|
| maintenance\_policy | This output will provide the Distinguished Name of the Maintenance Policy. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
