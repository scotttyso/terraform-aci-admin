#----------------------------------------------
# Create a Login Domain
#----------------------------------------------

/*
API Information:
 - Class: "aaaUserEp"
 - Distinguished Name: "uni/userext"
GUI Location:
 - Admin > AAA > Authentication:AAA > Login Domain
*/
# strength (true|false)
# realm (ldap|local|radius|rsa|saml|tacacs)
resource "aci_rest" "login_domain_radius" {
  for_each   = local.login_domain_radius
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
            "annotation": "${each.value["annotation"]}",
            "dn": "uni/userext/logindomain-${each.value["login_domain"]}",
            "name": "${each.value["login_domain"]}",
            "nameAlias": "${each.value["name_alias"]}",
            "pwdStrengthCheck": "${each.value["pwd_strength_check"]}",
          },
          "children": [
            {
              "aaaDomainAuth": {
                "attributes": {
                  "annotation": "${each.value["annotation"]}",
                  "descr": "${each.value["description"]}",
                  "dn": "uni/userext/logindomain-${each.value["login_domain"]}/domainauth",
                  "providerGroup": "${each.value["provider_group"]}",
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
                  "dn": "uni/userext/radiusext/radiusprovidergroup-${each.value["provider_group"]}"
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