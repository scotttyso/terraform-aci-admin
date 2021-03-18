# maintenance_node_block - Maintenance Group Node Block Terraform Module

## Usage

```hcl
module "maintenance_node_block" {

  source = "terraform-aci-admin//modules/maintenance_node_block"

  # omitted...
}
```

Use this module to with ACI 4.X and below to assign Leaf/Spine Nodes to a Maintenance Policy Group.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "fabricNodeBlk"
* Distinguished Name: "uni/fabric/maintgrp-{Maintenance Group Name}/nodeblk-{Block Name}"
* GUI Location: Admin > Firmware > Nodes > {Maintenance Group Name}

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
| maintenance\_node\_block | Add Nodes to a Maintenance Group Policy. | <pre>map(object({<br>    annotation           = optional(string)<br>    description          = optional(string)<br>    maintenance_group_dn = optional(string)<br>    node_id_from         = optional(number)<br>    node_id_to           = optional(number)<br>    name_alias           = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "maintenance_group_dn": "",<br>    "name_alias": "",<br>    "node_id_from": 201,<br>    "node_id_to": 201<br>  }<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
