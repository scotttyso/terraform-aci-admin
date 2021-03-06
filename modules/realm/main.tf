#----------------------------------------------
# Create an Authentication REALM
#----------------------------------------------

resource "aci_rest" "realm" {
  for_each   = local.realm
  path       = "/api/node/mo/uni/userext/authrealm.json"
  class_name = "aaaAuthRealm"
  payload    = <<EOF
{
  "aaaAuthRealm": {
    "attributes": {
      "dn": "uni/userext/authrealm"
    },
    "children": [
      {
        "${child_class}": {
          "attributes": {
            "dn": "uni/userext/authrealm/${auth_realm}auth",
            "providerGroup": "${login_domain}",
            "realm": "${domain_type}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
