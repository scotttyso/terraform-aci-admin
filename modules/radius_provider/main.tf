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
  path       = "/api/node/mo/uni/userext/radiusext/radiusprovider-${var.hostname}.json"
  class_name = "aaaRadiusProvider"
  payload    = <<EOF
{
  "aaaRadiusProvider": {
    "attributes": {
      "annotation": "${var.annotation_provider}",
      "authProtocol": "${var.auth_protocol}",
      "descr": "${var.descr_provider}",
      "dn": "uni/userext/radiusext/radiusprovider-${var.hostname}",
      "key": "${var.key}",
      "monitorServer": "${var.monitor}",
      "monitoringUser": "${var.monitor_user}"
      "monitoringPassword": "${var.monitor_pwd}"
      "name": "${var.hostname}",
      "nameAlias": "${var.name_alias_provider}",
      "port": "${var.port}",
      "retries": "${var.retries}",
      "timeout": "${var.timeout}",
    },
    "children": [
      {
        "aaaRsSecProvToEpg": {
          "attributes": {
            "tDn": "${var.mgmt_domain_dn}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}

/*
API Information:
 - Class: "aaaProviderRef"
 - Distinguished Name: "uni/userext/radiusext/radiusprovider-{Provider Group}"
GUI Location:
 - Admin > AAA > Authentication
*/
resource "aci_rest" "provider_group_radius" {
  path       = "/api/node/mo/${var.radius_provider_group_dn}.json"
  class_name = "aaaProviderRef"
  payload    = <<EOF
{
  "aaaProviderRef": {
    "attributes": {
      "annotation": "${var.annotation_prov_grp}",
      "descr": "${var.descr_prov_grp}",
      "dn": "${var.radius_provider_group_dn}/providerref-${var.hostname}",
      "name": "${var.hostname}",
      "nameAlias": "${var.name_alias_prov_grp}",
      "order": "${var.priority}",
    }
  }
}
  EOF
}
