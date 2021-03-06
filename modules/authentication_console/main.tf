#----------------------------------------------
# Configure Console Authentication Realm
#----------------------------------------------

/*
API Information:
 - Class: "aaaConsoleAuth"
 - Distinguished Name: "uni/userext/authrealm/consoleauth"
GUI Location:
 - Admin > AAA > Authentication:AAA > Console Authentication
*/
resource "aci_rest" "authentication_console" {
  path       = "/api/node/mo/uni/userext/authrealm/consoleauth.json"
  class_name = "aaaConsoleAuth"
  payload    = <<EOF
{
  "aaaConsoleAuth": {
    "attributes": {
      "annotation": "${var.annotation}",
      "descr": "${var.description}",
      "dn": "uni/userext/authrealm/consoleauth",
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
