#----------------------------------------------
# Create a TACACS+ Source
#----------------------------------------------

/*
API Information:
 - Class: "tacacsSrc"
 - Distinguished Name: "uni/fabric/moncommon/tacacssrc-TACACS_Src"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:TACACS > Create TACACS Source
*/
resource "aci_rest" "tacacs_source" {
  for_each   = local.tacacs_source
  path       = "/api/node/mo/uni/fabric/moncommon/tacacssrc-${each.value["tacacs_source"]}.json"
  class_name = "tacacsSrc"
  payload    = <<EOF
{
  "tacacsSrc": {
    "attributes": {
      "dn": "uni/fabric/moncommon/tacacssrc-${each.value["tacacs_source"]}",
      "name": "${each.value["tacacs_source"]}",
      "rn": "tacacssrc-${each.value["tacacs_source"]}"
    },
    "children": [
      {
        "tacacsRsDestGroup": {
          "attributes": {
            "tDn": "${each.value["accounting_group_id"]}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
