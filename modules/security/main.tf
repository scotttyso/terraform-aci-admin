#----------------------------------------------------
# Configure Password and Timeout Security Parameters
#----------------------------------------------------

/*
API Information:
 - Class: "aaaUserEp"
   - subClass: "aaaPwdProfile"
   - subClass: "aaaBlockLoginProfile"
 - Class: "pkiEp"
   - subClass: "pkiWebTokenData"
 - Distinguished Name: "uni/userext"
 - Distinguished Name: "uni/userext/blockloginp"
 - Distinguished Name: "uni/userext/pwdprofile"
 - Distinguished Name: "uni/userext/pkiext/webtokendata"
GUI Location:
 - Admin > AAA > Security
*/
resource "aci_rest" "system_security" {
  for_each   = local.system_security
  path       = "/api/node/mo/uni/userext.json"
  class_name = "aaaUserEp"
  payload    = <<EOF
{
  "aaaUserEp": {
    "attributes": {
      "dn": "uni/userext",
      "pwdStrengthCheck": "${each.value["pwd_strength_check"]}"(boolean)
    },
    "children": [
      {
        "aaaPwdProfile": {
          "attributes": {
            "annotation": "${each.value["annotation_aaaPwd"]}",
            "changeCount": "${each.value["change_count"]}",2,0-10
            "changeDuringInterval": "${each.value["enforce_interval"]}",(enable|disable)
            "ChangeInterval": "${each.value["pwd_change_interval"]}",48,0-745
            "descr": "",
            "dn": "uni/userext/pwdprofile",
            "expirationWarnTime": "15",
            "noChangeInterval": "${each.value["pwd_nochange_interval"]}",
            "historyCount": "${each.value["pwd_to_store"]}"5,0-15
          },
          "children": []
        }
      },
      {
        "aaaBlockLoginProfile": {
          "attributes": {
            "annotation": "${each.value["annotation_aaaBlock"]}",
            "blockDuration": "${each.value["duration_lockout"]}",60,1-1440
            "descr": "",
            "dn": "uni/userext/blockloginp",
            "enableLoginBlock": "${each.value["lockout"]}",(enable|disable)
            "maxFailedAttempts": "${each.value["max_failed_attempts"]}",5,1-15
            "maxFailedAttemptsWindow": "${each.value["max_failed_window"]}",5,1-720
          },
          "children": []
        }
      },
      {
        "pkiEp": {
          "attributes": {
            "dn": "uni/userext/pkiext"
          },
          "children": [
            {
              "pkiWebTokenData": {
                "attributes": {
                  "dn": "uni/userext/pkiext/webtokendata",
                  "maximumValidityPeriod": "${each.value["webtoken_validity"]}",24,4-24
                  "webtokenTimeoutSeconds": "${each.value["webtoken_timeout"]}",600,300-9600
                  "uiIdleTimeoutSeconds": "${each.value["web_idle_timeout"]}",1200,60-65525
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
