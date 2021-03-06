#----------------------------------------------
# Create a TACACS+ Provider
#----------------------------------------------

/*
API Information:
 - Class: "tacacsGroup"
 - Distinguished Name: "uni/fabric/tacacsgroup-TACACS_acct"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > TACACS > [TACACS Accounting Dest Group] > [TACACS Destinations]
*/
resource "aci_rest" "tacacs_accounting" {
  for_each   = local.tacacs_provider
  path       = "/api/node/mo/uni/fabric/tacacsgroup-${each.value["accounting_group"]}.json"
  class_name = "tacacsGroup"
  payload    = <<EOF
{
  "tacacsGroup": {
    "attributes": {
      "annotation": "${each.value["annotation_accounting"]}",
      "dn": "uni/fabric/tacacsgroup-${each.value["accounting_group"]}",
      "descr": "${each.value["descr_accounting"]}",
      "name": "${each.value["accounting_group"]}",
      "nameAlias": "${each.value["name_alias_accounting"]}",
    },
    "children": [
      {
        "tacacsTacacsDest": {
          "attributes": {
            "authProtocol": "${each.value["auth_protocol"]}",
            "dn": "uni/fabric/tacacsgroup-${each.value["accounting_group"]}/tacacsdest-${each.value["server"]}-port-${each.value["port"]}",
            "host": "${each.value["server"]}",
            "key": "${each.value["secret"]}",
          },
          "children": [
            {
              "fileRsARemoteHostToEpg": {
                "attributes": {
                  "tDn": "${each.value["mgmt_domain_id"]}"
                }
              }
            }
          ]
        }
      }
    ]
  }
}
  EOF
}

/*
API Information:
 - Class: "aaaTacacsPlusProvider"
 - Distinguished Name: "userext/tacacsext/tacacsplusprovider-${TACACS_Server}"
GUI Location:
 - Admin > AAA > Authentication:TACACS > Create TACACS Provider
*/
resource "aci_rest" "tacacs_provider" {
  for_each   = local.tacacs_provider
  path       = "/api/node/mo/uni/userext/tacacsext/tacacsplusprovider-${TACACS_Server}.json"
  class_name = "aaaTacacsPlusProvider"
  payload    = <<EOF
{
  "aaaTacacsPlusProvider": {
    "attributes": {
      "annotation": "${each.value["annotation_provider"]}",
      "authProtocol": "${each.value["auth_protocol"]}",
      "descr": "${each.value["description"]}",
      "dn": "uni/userext/tacacsext/tacacsplusprovider-${each.value["server"]}",
      "key": "${each.value["secret"]}",
      "monitorServer": "${each.value["monitor"]}",
      "name": "${each.value["server"]}",
      "nameAlias": "${each.value["name_alias_provider"]}",
      "port": "${each.value["port"]}",
      "retries": "${each.value["retries"]}",
      "timeout": "${each.value["timeout"]}",
    },
    "children": [
      {
        "aaaRsSecProvToEpg": {
          "attributes": {
            "tDn": "${each.value["management_domain"]}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}

resource "aci_rest" "provider_group_tacacs" {
  for_each   = local.tacacs_provider
  path       = "/api/node/mo/uni/userext/radiusext/radiusprovider-${each.value["server"]}.json"
  class_name = "aaaProviderRef"
  payload    = <<EOF
{
  "aaaProviderRef": {
    "attributes": {
      "annotation": "${each.value["annotation_prov_grp"]}",
      "descr": "${each.value["description"]}",
      "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-${each.value["provider_group"]}/providerref-${each.value["server"]}",
      "name": "${each.value["server"]}",
      "nameAlias": "${each.value["name_alias_prov_grp"]}",
      "order": "${each.value["order"]}",
    }
  }
}
  EOF
}
