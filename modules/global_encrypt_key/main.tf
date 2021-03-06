#--------------------------------------------------------
# Configure the Global AES Passphrase Ecryption Settings
#--------------------------------------------------------

/*
API Information:
 - Class: "pkiExportEncryptionKey"
 - Distinguished Name: "uni/exportcryptkey"
GUI Location:
 - System > System Settings > Global AES Passphrase Ecryption Settings
*/
resource "aci_rest" "encryption_key" {
  path       = "/api/node/mo/uni/exportcryptkey.json"
  class_name = "pkiExportEncryptionKey"
  payload    = <<EOF
{
  "pkiExportEncryptionKey": {
    "attributes": {
      "annotation": "${var.annotation}",
      "descr": "${var.description}",
      "nameAlias": "${var.name_alias}",
      "dn": "uni/exportcryptkey",
      "strongEncryptionEnabled": "${var.strong_encrypt}",
      "passphrase": "${var.encryption_key}"
    },
    "children": []
  }
}
  EOF
}
