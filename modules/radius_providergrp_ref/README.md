# radius_providergrp_ref - RADIUS Provider Group Reference Terraform Module - aci_rest

## Usage

```hcl
module "radius_providergrp_ref" {

  source = "terraform-aci-access//modules/radius_providergrp_ref"

  # omitted...
}
```

This module will Assocaite a RADIUS Provider to a Provider Group.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

**RADIUS Provider Group Reference:**

* Class: "aaaProviderRef"
* Distinguished Name: "uni/userext/radiusext/radiusprovidergroup-{Provider Group}"
* GUI Location: Admin > AAA > Authentication

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
| description | The Description for the provider in the Provider Group. | `string` | `""` | no |
| hostname | RADIUS security servers are identified on the basis of their host name or IP address.<br>Note: If the APIC is configured for in-band management connectivity, choosing an out-of-band management endpoint group for RADIUS access does not take effect. Alternatively, an out-of-band over an in-band management endpoint group can connect a RADIUS server but requires configuring a static route for the RADIUS server. | `string` | n/a | yes |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| priority | Choose a higher priority, (order), for the server to authenticate first.  The highest priority is 0 and lowest is 17.  Default is 0. | `number` | `0` | no |
| radius\_provider\_group | The Name for the RADIUS Provider Group. | `string` | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
