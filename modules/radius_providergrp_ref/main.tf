#---------------------------------------------------
# Associate a RADIUS Provider with a Provider Group
#---------------------------------------------------

/*
API Information:
 - Class: "aaaProviderRef"
 - Distinguished Name: "uni/userext/radiusext/radiusprovider-{Provider Group}"
GUI Location:
 - Admin > AAA > Authentication
*/
resource "aci_rest" "provider_group_radius" {
  path       = "/api/node/mo/uni/userext/radiusext/radiusprovidergroup-${var.radius_provider_group}/providerref-${var.hostname}.json"
  class_name = "aaaProviderRef"
  payload    = <<EOF
{
  "aaaProviderRef": {
    "attributes": {
      "annotation": "${var.annotation}",
      "descr": "${var.description}",
      "dn": "uni/userext/radiusext/radiusprovidergroup-${var.radius_provider_group}/providerref-${var.hostname}",
      "name": "${var.hostname}",
      "nameAlias": "${var.name_alias}",
      "order": "${var.priority}",
    }
  }
}
  EOF
}
