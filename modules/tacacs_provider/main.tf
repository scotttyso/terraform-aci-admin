#----------------------------------------------
# Create a TACACS+ Provider
#----------------------------------------------

/*
API Information:
 - Class: "tacacsGroup"
 - Distinguished Name: "uni/fabric/tacacsgroup-TACACS_acct"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > TACACS > [TACACS Accounting Dest Group] > [TACACS Destinations]
*/
resource "aci_rest" "tacacs_accounting" {
  path       = "/api/node/mo/uni/fabric/tacacsgroup-TACACS_acct.json"
  class_name = "tacacsGroup"
  payload    = <<EOF
{
  "tacacsGroup": {
    "attributes": {
      "dn": "uni/fabric/tacacsgroup-TACACS_acct",
      "descr": "TACACS Accounting Group TACACS_acct - Created by Terraform Startup Wizard",
      "name": "TACACS_acct",
      "rn": "tacacsgroup-TACACS_acct"
    },
    "children": [
      {
        "tacacsTacacsDest": {
          "attributes": {
            "dn": "uni/fabric/tacacsgroup-TACACS_acct/tacacsdest-${TACACS_Server}-port-${Port}",
            "authProtocol": "${Auth_Proto}",
            "host": "${TACACS_Server}",
            "key": "${Shared_Secret}",
            "rn": "tacacsdest-${TACACS_Server}-port-${Port}"
          },
          "children": [
            {
              "fileRsARemoteHostToEpg": {
                "attributes": {
                  "tDn": "uni/tn-mgmt/mgmtp-default/${Mgmt_Domain}"
                }
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

/*
API Information:
 - Class: "aaaTacacsPlusProvider"
 - Distinguished Name: "userext/tacacsext/tacacsplusprovider-${TACACS_Server}"
GUI Location:
 - Admin > AAA > Authentication:TACACS > Create TACACS Provider
*/
resource "aci_rest" "tacacs_provider" {
  path       = "/api/node/mo/uni/userext/tacacsext/tacacsplusprovider-${TACACS_Server}.json"
  class_name = "aaaTacacsPlusProvider"
  payload    = <<EOF
{
  "aaaTacacsPlusProvider": {
    "attributes": {
      "dn": "uni/userext/tacacsext/tacacsplusprovider-${TACACS_Server}",
      "timeout": "${Timeout}",
      "retries": "${Retry_Interval}",
      "monitorServer": "disabled",
      "key": "${Shared_Secret}",
      "authProtocol": "${Auth_Proto}",
      "port": "${Port}",
      "name": "${TACACS_Server}",
      "descr": "TACACS+ Provider - ${TACACS_Server}.  Added by Terraform Startup Wizard.",
    },
    "children": [
      {
        "aaaRsSecProvToEpg": {
          "attributes": {
            "tDn": "uni/tn-mgmt/mgmtp-default/${Mgmt_Domain}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}


resource "aci_rest" "tacacs_provider_group" {
  path       = "/api/node/mo/uni/userext/tacacsext/tacacsplusprovider-${TACACS_Server}.json"
  class_name = "aaaTacacsPlusProvider"
  payload    = <<EOF
{
	"aaaProviderRef": {
		"attributes": {
			"dn": "uni/userext/tacacsext/tacacsplusprovidergroup-ISEplus/providerref-198.18.1.5",
			"name": "198.18.1.5",
			"status": "created",
			"order": "3",
			"descr": "asdf",
		},
		"children": []
	}
}
  EOF
}

