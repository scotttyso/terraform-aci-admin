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
      "annotation": "${var.annotation}",
      "authPort": "${var.port}",
      "authProtocol": "${var.auth_protocol}",
      "descr": "${var.description}",
      "dn": "uni/userext/radiusext/radiusprovider-${var.hostname}",
      "key": "${var.key}",
      "monitorServer": "${var.monitor}",
      "monitoringUser": "${var.monitor_user}",
      "monitoringPassword": "${var.monitor_pwd}",
      "name": "${var.hostname}",
      "nameAlias": "${var.name_alias}",
      "retries": "${var.retries}",
      "timeout": "${var.timeout}"
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
