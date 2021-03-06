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
            "annotation": "",
            "dn": "uni/userext/logindomain-Word",
            "name": "Word",
            "nameAlias": ""
          },
          "children": [
            {
              "aaaDomainAuth": {
                "attributes": {
                  "annotation": "",
                  "descr": "",
                  "dn": "uni/userext/logindomain-Word/domainauth",
                  "providerGroup": "Word",
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
                  "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-Word",
                  "name": "Word"
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
