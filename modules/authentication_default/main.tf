#----------------------------------------------
# Configure Default Authentication Realm
#----------------------------------------------

/*
API Information:
 - Class: "aaaDefaultAuth"
 - Distinguished Name: "uni/userext/authrealm/defaultauth"
GUI Location:
 - Admin > AAA > Authentication:AAA > Default Authentication
*/
resource "aci_rest" "authentication_console" {
  path       = "/api/node/mo/uni/userext/authrealm/defaultauth.json"
  class_name = "aaaConsoleAuth"
  payload    = <<EOF
{
  "aaaDefaultAuth": {
    "attributes": {
      "annotation": "${var.annotation}",
      "descr": "${var.description}",
      "dn": "uni/userext/authrealm/defaultauth",
      "nameAlias": "${var.name_alias}",
      "providerGroup": "${var.provider_group}",
      "realm": "${var.realm}"
      "realmSubType": "${var.realm_subtype}"
    },
    "children": []
  }
}
  EOF
}
