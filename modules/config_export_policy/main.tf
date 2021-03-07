#--------------------------------------------------------------------
# Configure the Configuration Export Policy for Configuration Export
#--------------------------------------------------------------------

/*
API Information:
 - Class: "configExportP"
 - Distinguished Name: "uni/fabric/configexp-{name}"
GUI Location:
 - Admin > Import/Export > Export Policies > Configuration > {name}
*/
resource "aci_rest" "config_export_policy" {
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
            "tnTrigSchedPName": "${var.scheduler}"
          },
          "children": []
        }
      },
      {
        "configRsRemotePath": {
          "attributes": {
            "tnFileRemotePathName": "${var.remote_host}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
