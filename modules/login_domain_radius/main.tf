#----------------------------------------------
# Create a Login Domain for RADIUS Providers
#----------------------------------------------

/*
API Information:
 - Class: "aaaUserEp"
 - Distinguished Name: "uni/userext"
GUI Location:
 - Admin > AAA > Authentication:AAA > Login Domain
*/
resource "aci_rest" "login_domain_radius" {
  path       = "/api/node/mo/uni/userext.json"
  class_name = "aaaUserEp"
  payload    = <<EOF
{
  "aaaUserEp": {
    "attributes": {
      "dn": "uni/userext"
    },
    "children": [
      {
        "aaaLoginDomain": {
          "attributes": {
            "annotation": "${var.annotation_logindomain}",
            "dn": "uni/userext/logindomain-${var.name}",
            "name": "${var.name}",
            "nameAlias": "${var.name_alias}"
          },
          "children": [
            {
              "aaaDomainAuth": {
                "attributes": {
                  "annotation": "${var.annotation_providergroup}",
                  "descr": "${var.description}",
                  "dn": "uni/userext/logindomain-${var.name}/domainauth",
                  "providerGroup": "${local.provider_group}",
                  "realm": "radius"
                },
                "children": []
              }
            }
          ]
        }
      },
      {
        "aaaRadiusEp": {
          "attributes": {
            "dn": "uni/userext/radiusext"
          },
          "children": [
            {
              "aaaRadiusProviderGroup": {
                "attributes": {
                  "dn": "uni/userext/radiusext/radiusprovidergroup-${local.provider_group}"
                },
                "children": []
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
