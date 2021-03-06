#----------------------------------------------
# Create a RADIUS Provider
#----------------------------------------------

/*
API Information:
 - Class: "aaaRadiusProvider"
 - Distinguished Name: "uni/userext/radiusext/radiusprovider-{Radius Server}"
GUI Location:
 - Admin > AAA > Authentication:RADIUS > Create RADIUS Provider
*/
resource "aci_rest" "radius_provider" {
  for_each   = local.radius_provider
  path       = "/api/node/mo/uni/userext/radiusext/radiusprovider-${each.value["server"]}.json"
  class_name = "aaaRadiusProvider"
  payload    = <<EOF
{
  "aaaRadiusProvider": {
    "attributes": {
      "annotation": "${each.value["annotation"]}",
      "authProtocol": "${each.value["auth_protocol"]}",
      "descr": "${each.value["description"]}",
      "dn": "uni/userext/radiusext/radiusprovider-${each.value["server"]}",
      "key": "${each.value["secret"]}",
      "monitorServer": "${each.value["monitor"]}",
      "name": "${each.value["server"]}",
      "nameAlias": "${each.value["name_alias"]}",
      "port": "${each.value["port"]}",
      "retries": "${each.value["retries"]}",
      "timeout": "${each.value["timeout"]}",
    },
    "children": [
      {
        "aaaRsSecProvToEpg": {
          "attributes": {
            "tDn": "${each.value["mgmt_domain_id"]}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}

resource "aci_rest" "provider_group_radius" {
  for_each   = local.radius_provider
  path       = "/api/node/mo/uni/userext/radiusext/radiusprovider-${each.value["server"]}.json"
  class_name = "aaaProviderRef"
  payload    = <<EOF
{
  "aaaProviderRef": {
    "attributes": {
      "annotation": "${each.value["annotation_prov_grp"]}",
      "descr": "${each.value["description"]}",
      "dn": "uni/userext/radiusext/radiusprovidergroup-${each.value["provider_group"]}/providerref-${each.value["server"]}",
      "name": "${each.value["server"]}",
      "nameAlias": "${each.value["name_alias_prov_grp"]}",
      "order": "${each.value["order"]}",
    }
  }
}
  EOF
}
