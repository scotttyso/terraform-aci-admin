#----------------------------------------------
# Create a RADIUS Provider
#----------------------------------------------

/*
API Information:
 - Class: "aaaRadiusProvider"
 - Distinguished Name: "uni/userext/radiusext/radiusprovider-${RADIUS_Server}"
GUI Location:
 - Admin > AAA > Authentication:RADIUS > Create RADIUS Provider
*/
resource "aci_rest" "radius_provider" {
  path       = "/api/node/mo/uni/userext/radiusext/radiusprovider-${RADIUS_Server}.json"
  class_name = "aaaRadiusProvider"
  payload    = <<EOF
{
  "aaaRadiusProvider": {
    "attributes": {
      "dn": "uni/userext/radiusext/radiusprovider-${RADIUS_Server}",
      "timeout": "${Timeout}",
      "retries": "${Retry_Interval}",
      "monitorServer": "disabled",
      "key": "${Shared_Secret}",
      "authProtocol": "${Authz_Proto}",
      "name": "${RADIUS_Server}",
      "descr": "RADIUS Provider - ${RADIUS_Server}.  Added by Terraform Startup Wizard.",
      "rn": "radiusprovider-${RADIUS_Server}"
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

resource "aci_rest" "radius_provider_group" {
  path       = "/api/node/mo/uni/userext/radiusext/radiusprovider-${RADIUS_Server}.json"
  class_name = "aaaRadiusProvider"
  payload    = <<EOF
{
	"aaaProviderRef": {
		"attributes": {
			"annotation": "",
			"descr": "adsf",
			"dn": "uni/userext/radiusext/radiusprovidergroup-ISE_RAD/providerref-10.101.128.71",
			"name": "10.101.128.71",
			"nameAlias": "",
			"order": "3",
			"ownerKey": "",
			"ownerTag": "",
			"userdom": ":all:common:"
		}
	}
}
  EOF
}
