#----------------------------------------------
# Create a VPC Domain Pair
#----------------------------------------------

/*
API Information:
 - Class: "pkiExportEncryptionKey"
 - Distinguished Name: "uni/exportcryptkey"
GUI Location:
 - System > System Settings > Global AES Passphrase Ecryption Settings
*/
resource "aci_rest" "encryption_key" {
  for_each   = local.encryption_key
  path       = "/api/node/mo/uni/exportcryptkey.json"
  class_name = "pkiExportEncryptionKey"
  payload    = <<EOF
{
  "pkiExportEncryptionKey": {
    "attributes": {
      "annotation": "${each.value["annotation"]}",
      "descr": "${each.value["description"]}",
      "nameAlias": "${each.value["name_alias"]}",
      "dn": "uni/exportcryptkey",
      "strongEncryptionEnabled": "${each.value["strong_encrypt"]}",
      "passphrase": "${each.value["encryption_key"]}"
    },
    "children": []
  }
}
  EOF
}

/*
API Information:
 - Class: "trigSchedP"
 - Distinguished Name: "uni/fabric/schedp-Every24Hours"
GUI Location:
 - Admin > Schedulers > Fabric > Every24Hours
*/

# every-day|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday|odd-day|even-day
resource "aci_rest" "backup_scheduler" {
  for_each   = local.backup_scheduler
  path       = "/api/node/mo/uni/fabric/schedp-${each.value["name_scheduler"]}.json"
  class_name = "trigSchedP"
  payload    = <<EOF
{
  "trigSchedP": {
    "attributes": {
      "annotation": "${each.value["annotation_scheduler"]}",
      "descr": "${each.value["description"]}",
      "dn": "uni/fabric/schedp-${each.value["name_scheduler"]}",
      "name": "${each.value["name_scheduler"]}",
      "nameAlias": "${each.value["name_alias_scheduler"]}"
    },
    "children": [
      {
        "trigRecurrWindowP": {
          "attributes": {
            "annotation": "${each.value["annotation_window"]}",
            "concurCap": "${each.value["max_concurrent_nodes"]}",
            "day": "${each.value["day"]}",
            "dn": "uni/fabric/schedp-${each.value["schedule_name"]}/recurrwinp-${each.value["schedule_name"]}",
            "hour": "${each.value["hour"]}",
            "minute": "${each.value["minute"]}",
            "name": "${each.value["window_name"]}",
            "nameAlias": "${each.value["name_alias_window"]}",
            "procCap": "${each.value["max_running_time"]}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}

/*
API Information:
 - Class: "fileRemotePath"
 - Distinguished Name: "uni/fabric/path-${remote_host}"
GUI Location:
 - Admin > Import/Export > Remote Locations:${remote_host}
*/
# protocol (ftp|scp|sftp)
# auth_type (usePassword|useSshKeyContents)
resource "aci_rest" "remote_host" {
  for_each   = local.remote_host
  path       = "/api/node/mo/uni/fabric/path-${each.value["remote_host"]}.json"
  class_name = "fileRemotePath"
  payload    = <<EOF
{
  "fileRemotePath": {
    "attributes": {
      "annotation": "${each.value["annotation"]}",
      "authType": "${each.value["auth_type"]}",
      "dn": "uni/fabric/path-${each.value["remote_host"]}",
      "descr": "${each.value["description"]}",
      "host": "${each.value["remote_host"]}",
      "identityPrivateKeyContents": "${each.value["ssh_key"]}",
      "identityPrivateKeyPassphrase": "${each.value["passphrase"]}",
      "name": "${each.value["remote_host"]}",
      "nameAlias": "${each.value["name_alias"]}",
      "protocol": "${each.value["protocol"]}",
      "remotePath": "${each.value["remote_path"]}",
      "remotePort": "${each.value["port"]}",
      "userName": "${each.value["username"]}",
      "userPasswd": "${each.value["password"]}",
    },
    "children": [
      {
        "fileRsARemoteHostToEpg": {
          "attributes": {
            "tDn": "uni/tn-mgmt/mgmtp-default/${each.value["mgmt_domain"]}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}

/*
API Information:
 - Class: "configExportP"
 - Distinguished Name: "uni/fabric/configexp-{name}"
GUI Location:
 - Admin > Import/Export > Export Policies > Configuration > {name}
*/
# adminSt (triggered|untriggered)
# format (json|xml)
# Secure Fields (true|false)
# max snapshots is 1 to 101
# "maxSnapshotCount": "${each.value["snapshot_count"]}", global value
# snapshot (true|false)
# target_Dn
# "internalSource": "${each.value["format"]}",

resource "aci_rest" "backup_policy" {
  for_each   = local.backup_policy
  path       = "/api/node/mo/uni/fabric/configexp-${each.value["name"]}.json"
  class_name = "configExportP"
  payload    = <<EOF
{
  "configExportP": {
    "attributes": {
      "adminSt": "${each.value["admin_state"]}",
      "annotation": "${each.value["annotation"]}",
      "descr": "${each.value["description"]}",
      "dn": "uni/fabric/configexp-${each.value["name"]}",
      "format": "${each.value["format"]}",
      "includeSecureFields": "${each.value["secure_fields"]}",
      "name": "${each.value["name"]}",
      "nameAlias": "${each.value["name_alias"]}",
      "snapshot": "${each.value["snapshot"]}",
      "targetDn": "${each.value["target_Dn"]}"
    },
    "children": [
      {
        "configRsExportScheduler": {
          "attributes": {
            "tDn": "${each.value["scheduler_dn"]}"
          },
          "children": []
        }
      },
      {
        "configRsRemotePath": {
          "attributes": {
            "tnFileRemotePathName": "${Remote_Host}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
