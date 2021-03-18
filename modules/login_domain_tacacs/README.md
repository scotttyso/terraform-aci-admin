# login_domain_tacacs - Login Domain for TACACS+ Host Terraform Module - aci_rest

## Usage

```hcl
module "login_domain_tacacs" {

  source = "terraform-aci-admin//modules/login_domain_tacacs"

  # omitted...
}
```

This module will Create a Login Domain and attach a TACACS+ Provider Group to it.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "aaaUserEp"
* Distinguished Name: "uni/userext"
* GUI Location: Admin > AAA > Authentication:AAA > Login Domain

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
| annotation\_logindomain | Annotation for the Login Domain.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| annotation\_providergroup | Annotation for the Provider Group.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| description | A Description for the Provider Group. | `string` | `""` | no |
| name | A Name for The Login Domain. | `string` | `"TACACS"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| provider\_group | A name for the provider group.  If the provider\_group is undefined the name will be the same as the Login Domain. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| login\_domain\_tacacs | This output will provide the Distinguished Name of the TACACS+ Login Domain. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
