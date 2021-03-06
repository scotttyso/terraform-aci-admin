#----------------------------------------------
# Create a TACACS+ Accounting Group
#----------------------------------------------

/*
API Information:
 - Class: "tacacsGroup"
 - Distinguished Name: "uni/fabric/tacacsgroup-{TACACS+ Accounting Group}"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > TACACS > [TACACS Accounting Dest Group] > [TACACS Destinations]
*/
resource "aci_rest" "tacacs_accounting" {
  path       = "/api/node/mo/uni/fabric/tacacsgroup-${var.name}.json"
  class_name = "tacacsGroup"
  payload    = <<EOF
{
  "tacacsGroup": {
    "attributes": {
      "annotation": "${var.annotation}",
      "dn": "uni/fabric/tacacsgroup-${var.name}",
      "descr": "${var.description}",
      "name": "${var.name}",
      "nameAlias": "${var.name_alias}",
    },
    "children": []
  }
}
  EOF
}
