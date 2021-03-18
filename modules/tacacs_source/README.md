# tacacs_source - TACACS Source Terraform Module - aci_rest

## Usage

```hcl
module "tacacs_source" {

  source = "terraform-aci-admin//modules/tacacs_source"

  # omitted...
}
```

This module will Create a TACACS Source Group to Associate a TACACS+ Accounting Group to.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "tacacsSrc"
* Distinguished Name: "uni/fabric/moncommon/tacacssrc-{TACACS Source}"
* GUI Location: Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:TACACS > Create TACACS Source

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
| accounting\_group\_dn | The Distinguished Name for the TACACS+ Accounting Group. | `string` | n/a | yes |
| annotation | Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| description | The Description for the TACACS+ Source Group. | `string` | `""` | no |
| name | Name for the TACACS+ Source Group. | `string` | `"default"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
