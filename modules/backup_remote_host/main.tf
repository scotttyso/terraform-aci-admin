#--------------------------------------------------------
# Configure Remote Host for Configuration Export
#--------------------------------------------------------

/*
API Information:
 - Class: "fileRemotePath"
 - Distinguished Name: "uni/fabric/path-${remote_host}"
GUI Location:
 - Admin > Import/Export > Remote Locations:${remote_host}
*/
resource "aci_rest" "remote_host" {
  path       = "/api/node/mo/uni/fabric/path-${local.name}.json"
  class_name = "fileRemotePath"
  payload    = <<EOF
{
  "fileRemotePath": {
    "attributes": {
      "annotation": "${var.annotation}",
      "authType": "${var.auth_type}",
      "dn": "uni/fabric/path-${var.remote_host}",
      "descr": "${var.description}",
      "host": "${var.remote_host}",
      "identityPrivateKeyContents": "${var.ssh_key}",
      "identityPrivateKeyPassphrase": "${var.passphrase}",
      "name": "${local.name}",
      "nameAlias": "${var.name_alias}",
      "protocol": "${var.protocol}",
      "remotePath": "${var.remote_path}",
      "remotePort": "${var.remote_port}",
      "userName": "${var.username}",
      "userPasswd": "${var.password}",
    },
    "children": [
      {
        "fileRsARemoteHostToEpg": {
          "attributes": {
            "tDn": "${var.mgmt_domain_id}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
