# scheduler - Configuration Trigger Scheduler Terraform Module - aci_rest

## Usage

```hcl
module "scheduler" {

  source = "terraform-aci-access//modules/scheduler"

  # omitted...
}
```

This module will Create a Triggered Scheduler to be consumed by the configuration backup policy.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "trigSchedP"
* Distinguished Name: "uni/fabric/schedp-{Name}"
* GUI Location: Admin > Schedulers > Fabric > {Name}

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
| annotation\_scheduler | Annotation for the Scheduler.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| annotation\_window | Annotation for the Window.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| days | The day of the week that the recurring window begins. Options are:<br> * every-day<br> * Monday<br> * Tuesday<br> * Wednesday<br> * Thursday<br> * Friday<br> * Saturday<br> * Sunday<br> * odd-day<br> * even-day | `string` | `"every-day"` | no |
| description | A Description for the Remote Host. | `string` | `""` | no |
| hour | The hour that the recurring window begins. Specify the hour as 0 to 24. | `number` | `0` | no |
| max\_concurrent\_nodes | The concurrency capacity limit. This is the maximum number of tasks that can be processed concurrently.  Default is 0.  Value options are between 0 and 65535 | `number` | n/a | yes |
| max\_running\_time | The processing time capacity limit. This is the maximum duration of the window. The range is 0 to (2^64 - 1) milliseconds. The default value of 0 indicates unlimited, meaning there is no time limit enforced on the scheduler window. | `number` | `0` | no |
| minute | The minute that the recurring window begins. Specify the minute as 0 to 59. | `number` | `0` | no |
| name\_alias\_scheduler | Alias for the Scheduler.  A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| name\_alias\_window | Alias for the Window.  A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| name\_scheduler | The name for the scheduler policy. | `string` | `"default"` | no |
| name\_window | The name of the recurring schedule window. A schedule window that triggers a task every 24 hours.  If not defined the name of the scheduler will be used for the window as well.  This is optional. | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| scheduler | This output will provide the DN of the Triggered Scheduler Policy. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
