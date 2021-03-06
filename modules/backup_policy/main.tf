#--------------------------------------------------------
# Configure the Backup Policy for Configuration Export
#--------------------------------------------------------

/*
API Information:
 - Class: "configExportP"
 - Distinguished Name: "uni/fabric/configexp-{name}"
GUI Location:
 - Admin > Import/Export > Export Policies > Configuration > {name}
*/
resource "aci_rest" "backup_policy" {
  path       = "/api/node/mo/uni/fabric/configexp-${var.name}.json"
  class_name = "configExportP"
  payload    = <<EOF
{
  "configExportP": {
    "attributes": {
      "adminSt": "${var.admin_state}",
      "annotation": "${var.annotation}",
      "descr": "${var.description}",
      "dn": "uni/fabric/configexp-${var.name}",
      "format": "${var.format}",
      "includeSecureFields": "${var.secure_fields}",
      "name": "${var.name}",
      "nameAlias": "${var.name_alias}",
      "snapshot": "${var.snapshot}",
      "targetDn": "${var.target_dn}"
    },
    "children": [
      {
        "configRsExportScheduler": {
          "attributes": {
            "tDn": "${var.scheduler_dn}"
          },
          "children": []
        }
      },
      {
        "configRsRemotePath": {
          "attributes": {
            "tnFileRemotePathName": "${remote_host_dn}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
