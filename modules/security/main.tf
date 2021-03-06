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
  path       = "/api/node/mo/uni/userext.json"
  class_name = "aaaUserEp"
  payload    = <<EOF
{
  "aaaUserEp": {
    "attributes": {
      "dn": "uni/userext",
      "pwdStrengthCheck": "${var.pwd_strength_check}"
    },
    "children": [
      {
        "aaaPwdProfile": {
          "attributes": {
            "annotation": "${var.annotation_aaaPwd}",
            "changeCount": "${var.pwd_change_count}",
            "changeDuringInterval": "${var.pwd_enforce_interval}",
            "ChangeInterval": "${var.pwd_change_interval}",
            "descr": "",
            "dn": "uni/userext/pwdprofile",
            "expirationWarnTime": "${var.pwd_expiration_warn}",
            "noChangeInterval": "${var.pwd_nochange_interval}",
            "historyCount": "${var.pwd_history}"
          },
          "children": []
        }
      },
      {
        "aaaBlockLoginProfile": {
          "attributes": {
            "annotation": "${var.annotation_aaaBlock}",
            "blockDuration": "${var.lockout_duration}"
            "descr": "",
            "dn": "uni/userext/blockloginp",
            "enableLoginBlock": "${var.lockout}",
            "maxFailedAttempts": "${var.lockout_max_failed_attempts}",
            "maxFailedAttemptsWindow": "${var.lockout_time_period}"
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
                  "maximumValidityPeriod": "${var.webtoken_validity}",
                  "webtokenTimeoutSeconds": "${var.webtoken_timeout}",
                  "uiIdleTimeoutSeconds": "${var.web_idle_timeout}",
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
