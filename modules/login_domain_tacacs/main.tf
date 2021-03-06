#----------------------------------------------
# Create a Login Domain for TACACS+ Providers
#----------------------------------------------

/*
API Information:
 - Class: "aaaUserEp"
 - Distinguished Name: "uni/userext"
GUI Location:
 - Admin > AAA > Authentication:AAA > Login Domain
*/
resource "aci_rest" "login_domain_tacacs" {
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
                  "annotation": "${var.annotation_domainauth}",
                  "descr": "${var.description}",
                  "dn": "uni/userext/logindomain-${var.name}/domainauth",
                  "providerGroup": "${var.provider_group}",
                  "realm": "tacacs"
                },
                "children": []
              }
            }
          ]
        }
      },
      {
        "aaaTacacsPlusEp": {
          "attributes": {
            "dn": "uni/userext/tacacsext"
          },
          "children": [
            {
              "aaaTacacsPlusProviderGroup": {
                "attributes": {
                  "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-${var.provider_group}",
                  "name": "${var.provider_group}"
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
