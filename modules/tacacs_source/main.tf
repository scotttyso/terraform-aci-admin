#----------------------------------------------
# Create a TACACS+ Source
#----------------------------------------------

/*
API Information:
 - Class: "tacacsSrc"
 - Distinguished Name: "uni/fabric/moncommon/tacacssrc-{TACACS Source}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:TACACS > Create TACACS Source
*/
resource "aci_rest" "tacacs_source" {
  path       = "/api/node/mo/uni/fabric/moncommon/tacacssrc-${var.name}.json"
  class_name = "tacacsSrc"
  payload    = <<EOF
{
  "tacacsSrc": {
    "attributes": {
      "annotation": "${var.annotation}",
      "descr": "${var.description}",
      "dn": "uni/fabric/moncommon/tacacssrc-${var.name}",
      "name": "${var.name}",
      "nameAlias": "${var.name_alias}"
    },
    "children": [
      {
        "tacacsRsDestGroup": {
          "attributes": {
            "tDn": "${var.accounting_group_dn}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
