#----------------------------------------------
# Create a Login Domain
#----------------------------------------------

/*
API Information:
 - Class: "aaaUserEp"
 - Distinguished Name: "uni/userext"
GUI Location:
 - Admin > AAA > Authentication:AAA > Login Domain
*/
# strength (true|false)
# realm (ldap|local|radius|rsa|saml|tacacs)
# realmsubtype (default|duo)
# auto 	1ull 	Uses push or phone notification 	NO COMMENTS
# push 	2ull 	Push notification on DuoMobile app 	NO COMMENTS
# phone 	4ull 	Call the user phone 	NO COMMENTS
# passcode 	8ull 	Use a passcode generated on DuoMobile app 	NO COMMENTS
# DEFAULT 	auto(1ull) 	Uses push or phone notification 	NO COMMENTS
resource "aci_rest" "login_domain_tacacs" {
  for_each   = local.login_domain
  path       = "/api/node/mo/uni/userext.json"
  class_name = "aaaUserEp"
  payload    = <<EOF
{
	"aaaUserEp": {
		"attributes": {
			"dn": "uni/userext",
			"status": "modified"
		},
		"children": [
			{
				"aaaLoginDomain": {
					"attributes": {
						"dn": "uni/userext/logindomain-domain",
						"name": "domain",
						"rn": "logindomain-domain",
						"status": "created"
					},
					"children": [
						{
							"aaaDomainAuth": {
								"attributes": {
									"dn": "uni/userext/logindomain-domain/domainauth",
									"providerGroup": "domain",
									"realm": "tacacs",
									"descr": "asdf",
									"rn": "domainauth",
									"status": "created"
								},
								"children": []
							}
						}
					]
				}
			},
			{
				"aaaTacacsPlusEp": {
					"attributes": {
						"dn": "uni/userext/tacacsext",
						"status": "modified"
					},
					"children": [
						{
							"aaaTacacsPlusProviderGroup": {
								"attributes": {
									"dn": "uni/userext/tacacsext/tacacsplusprovidergroup-domain",
									"status": "created"
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
