# authentication_console - Console Authentication Realm Terraform Module - aci_rest

## Usage

```hcl
module "authentication_console" {

  source = "terraform-aci-access//modules/authentication_console"

  # omitted...
}
```

This module will Configure the Autnetication Realm for Console based Authentication.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "aaaConsoleAuth"
* Distinguished Name: "uni/userext/authrealm/consoleauth"
* GUI Location: Admin > AAA > Authentication:AAA > Console Authentication

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
| description | The Description for Console Authentication realm. | `string` | `""` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| provider\_group | The Name for the Provider Group that was created with the Login Domain.  If the realm is local then leave this blank. | `string` | `""` | no |
| realm | The security method for processing authentication and authorization requests. Options are ldap, local, radius, rsa, saml, and tacacs.  The default is local.  The realm allows the protected resources on the associated server to be partitioned into a set of protection spaces, each with its own authentication authorization database. This is an abstract class and cannot be instantiated. | `string` | `"local"` | no |
| realm\_subtype | Realm subtype that can be default or Duo.  Default is default. | `string` | `"default"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
