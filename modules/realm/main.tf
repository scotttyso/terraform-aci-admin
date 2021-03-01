#----------------------------------------------
# Create an Authentication REALM
#----------------------------------------------

resource "aci_rest" "realm" {
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
            "dn": "uni/userext/authrealm/${Auth_Realm}auth",
{%- if Login_Domain %}
            "providerGroup": "${Login_Domain}",{% endif %}
            "realm": "${Domain_Type}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
