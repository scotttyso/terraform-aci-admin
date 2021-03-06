# radius_provider - RADIUS Provider Terraform Module - aci_rest

## Usage

```hcl
module "radius_provider" {

  source = "terraform-aci-access//modules/radius_provider"

  # omitted...
}
```

This module will Configure a RADIUS Provider and add to a Provider Group.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

**RADIUS Provider:**

* Class: "aaaRadiusProvider"
* Distinguished Name: "uni/userext/radiusext/radiusprovider-{Radius Server}"
* GUI Location: Admin > AAA > Authentication:RADIUS > Create RADIUS Provider

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
| annotation\_prov\_grp | Annotation for the provider in the Provider Group.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| annotation\_provider | Annotation for the Provider.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| auth\_protocol | Defines the authentication protocol to use with the RADIUS server.  Options are chap, mschap, pap.  The default is pap. | `string` | `"pap"` | no |
| descr\_prov\_grp | The Description for the provider in the Provider Group. | `string` | `""` | no |
| descr\_provider | The description of the RADIUS provider. | `string` | `""` | no |
| hostname | RADIUS security servers are identified on the basis of their host name or IP address.<br>Note: If the APIC is configured for in-band management connectivity, choosing an out-of-band management endpoint group for RADIUS access does not take effect. Alternatively, an out-of-band over an in-band management endpoint group can connect a RADIUS server but requires configuring a static route for the RADIUS server. | `string` | n/a | yes |
| key | The secret text string shared between the device and a specific RADIUS server. | `string` | n/a | yes |
| mgmt\_domain\_dn | The Distinguished Name for the Management Domain.<br> Example: "uni/tn-mgmt/mgmtp-default/oob-default" | `string` | `"uni/tn-mgmt/mgmtp-default/oob-default"` | no |
| monitor | Server Monitoring can be configured through RADIUS, TACACS+, LDAP, and RSA to determine whether the respective AAA servers are active.  Server monitoring is not supported on leaves and spines. If enabled, all the providers will be marked operable on leaves and spines. | `string` | `"enabled"` | no |
| monitor\_pwd | Password to use for testing RADIUS server functionality. | `string` | `""` | no |
| monitor\_user | Username to use for testing RADIUS server functionality. | `string` | `"default"` | no |
| name\_alias\_prov\_grp | Alias for the RADIUS Provider Group Reference.  A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| name\_alias\_provider | Alias for the RADIUS Provider.  A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| port | The service port number for the RADIUS service. The range is from 1 to 65535. The default is 1812; another common value is also 1645. | `number` | `1812` | no |
| priority | Choose a higher priority, (order), for the server to authenticate first.  The highest priority is 0 and lowest is 17.  Default is 0. | `number` | `0` | no |
| radius\_provider\_group\_dn | The Distinguished Name for the RADIUS Provider Group. | `string` | n/a | yes |
| retries | The number of retries when contacting the RADIUS endpoint. The range is from 0 to 5 retries. The default 1. | `number` | `1` | no |
| timeout | The timeout for communication with a RADIUS provider server. The range is from 1 to 60 seconds. The default is 5 seconds. If set to 0, the AAA provider timeout is used. | `number` | `5` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
