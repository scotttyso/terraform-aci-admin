#----------------------------------------------
# Create a RADIUS Provider
#----------------------------------------------

/*
API Information:
 - Class: "aaaRadiusProvider"
 - Distinguished Name: "uni/userext/radiusext/radiusprovider-${var.RADIUS_Server}"
GUI Location:
 - Admin > AAA > Authentication:RADIUS > Create RADIUS Provider
*/
resource "aci_rest" "radius_provider" {
  path       = "/api/node/mo/uni/userext/radiusext/radiusprovider-${var.RADIUS_Server}.json"
  class_name = "aaaRadiusProvider"
  payload    = <<EOF
{
  "aaaRadiusProvider": {
    "attributes": {
      "dn": "uni/userext/radiusext/radiusprovider-${var.RADIUS_Server}",
      "timeout": "${var.Timeout}",
      "retries": "${var.Retry_Interval}",
      "monitorServer": "disabled",
      "key": "${var.Shared_Secret}",
      "authProtocol": "${var.Authz_Proto}",
      "name": "${var.RADIUS_Server}",
      "descr": "RADIUS Provider - ${var.RADIUS_Server}.  Added by Terraform Startup Wizard.",
      "rn": "radiusprovider-${var.RADIUS_Server}"
    },
    "children": [
      {
        "aaaRsSecProvToEpg": {
          "attributes": {
            "tDn": "uni/tn-mgmt/mgmtp-default/${var.Mgmt_Domain}"
          },
          "children": []
        }
      }
    ]
  }
}
{
	"aaaProviderRef": {
		"attributes": {
			"annotation": "",
			"descr": "asdf",
			"dn": "uni/userext/duoext/duoprovidergroup-test_duo/providerref-8.8.8.8",
			"name": "8.8.8.8",
			"nameAlias": "",
			"order": "1",
			"ownerKey": "",
			"ownerTag": "",
			"userdom": ":all:common:"
		}
	}
}
  EOF
}

