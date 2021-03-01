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
# realmsubtype (default|duo)
# auto 	1ull 	Uses push or phone notification 	NO COMMENTS
# push 	2ull 	Push notification on DuoMobile app 	NO COMMENTS
# phone 	4ull 	Call the user phone 	NO COMMENTS
# passcode 	8ull 	Use a passcode generated on DuoMobile app 	NO COMMENTS
# DEFAULT 	auto(1ull) 	Uses push or phone notification 	NO COMMENTS
resource "aci_rest" "login_domain" {
  for_each   = local.login_domain
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
                  "realm": "${each.value["realm"]}",
                  "realmSubType": "${each.value["sub_type"]}",
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
                  "dn": "uni/userext/radiusext/radiusprovidergroup-${Login_Domain}"
                },
                "children": [
                  {
                    "aaaProviderRef": {
                      "attributes": {
                        "dn": "uni/userext/radiusext/radiusprovidergroup-${Login_Domain}/providerref-${RADIUS_Server}",
                        "order": "${Domain_Order}",
                        "name": "${RADIUS_Server}",
                        "descr": "Added RADIUS Server ${RADIUS_Server} - Terraform Startup Wizard"
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
    ]
  }
}
  EOF
}
