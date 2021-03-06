# tacacs_accounting - TACACS+ Accounting Terraform Module - aci_rest

## Usage

```hcl
module "tacacs_provider" {

  source = "terraform-aci-access//modules/tacacs_provider"

  # omitted...
}
```

This module will Create a TACACS+ Accounting Group.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

**TACACS+ Accounting Group:**

* Class: "tacacsGroup"
* Distinguished Name: "uni/fabric/tacacsgroup-{TACACS+ Accounting Group}"
* GUI Location: Admin > External Data Collectors > Monitoring Destinations > TACACS > [TACACS Accounting Dest Group] > [TACACS Destinations]

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
| description | The Description for the TACACS+ Accounting Group. | `string` | `""` | no |
| name | Name for the TACACS+ Accounting Group. | `string` | `"default"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| accounting\_group | This output will provide the DN of the TACACS+ Accounting Group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
