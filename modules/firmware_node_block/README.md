# firmware_node_block - Firmware Group Node Block Terraform Module

## Usage

```hcl
module "firmware_node_block" {

  source = "terraform-aci-access//modules/firmware_node_block"

  # omitted...
}
```

Use this module to Assign Leaf/Spine Nodes to a Firmware Policy Group.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "fabricNodeBlk"
* Distinguished Name: "uni/fabric/fwgrp-{Firmware Group Name}/nodeblk-{name}"
* GUI Location: Admin > Firmware > Nodes > {Firmware Group Name}

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
| [aci_node_block_firmware](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/node_block_firmware) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| node\_firmware\_block | Add Nodes to a Firmware Group Policy. | <pre>map(object({<br>    annotation        = optional(string)<br>    description       = optional(string)<br>    firmware_group_dn = optional(string)<br>    name_alias        = optional(string)<br>    node_id_from      = optional(number)<br>    node_id_to        = optional(number)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "firmware_group_dn": "",<br>    "name_alias": "",<br>    "node_id_from": 201,<br>    "node_id_to": 201<br>  }<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
