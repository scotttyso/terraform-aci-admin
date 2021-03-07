#----------------------------------------------
# Create a TACACS+ Provider
#----------------------------------------------

/*
API Information:
 - Class: "tacacsGroup"
 - Distinguished Name: "uni/fabric/tacacsgroup-{TACACS+ Accounting Group}"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > TACACS > [TACACS Accounting Dest Group] > [TACACS Destinations]
*/
resource "aci_rest" "accounting_group_dest" {
  path       = "/api/node/mo/${var.accounting_group_dn}/tacacsdest-${var.hostname}-port-${var.port}.json"
  class_name = "tacacsTacacsDest"
  payload    = <<EOF
{
  "tacacsTacacsDest": {
    "attributes": {
      "authProtocol": "${var.auth_protocol}",
      "dn": "${var.accounting_group_dn}/tacacsdest-${var.hostname}-port-${var.port}",
      "host": "${var.hostname}",
      "key": "${var.key}",
    },
    "children": [
      {
        "fileRsARemoteHostToEpg": {
          "attributes": {
            "tDn": "${var.mgmt_domain_dn}"
          }
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
 - Distinguished Name: "userext/tacacsext/tacacsplusprovider-${Provider Group}"
GUI Location:
 - Admin > AAA > Authentication:TACACS > Create TACACS+ Provider
*/
resource "aci_rest" "tacacs_provider" {
  path       = "/api/node/mo/uni/userext/tacacsext/tacacsplusprovider-${var.hostname}.json"
  class_name = "aaaTacacsPlusProvider"
  payload    = <<EOF
{
  "aaaTacacsPlusProvider": {
    "attributes": {
      "annotation": "${var.annotation_provider}",
      "authProtocol": "${var.auth_protocol}",
      "descr": "${var.descr_provider}",
      "dn": "uni/userext/tacacsext/tacacsplusprovider-${var.hostname}",
      "key": "${var.key}",
      "monitorServer": "${var.monitor}",
      "monitoringUser": "${var.monitor_user}",
      "monitoringPassword": "${var.monitor_pwd}",
      "name": "${var.hostname}",
      "nameAlias": "${var.name_alias_provider}",
      "port": "${var.port}",
      "retries": "${var.retries}",
      "timeout": "${var.timeout}",
    },
    "children": [
      {
        "aaaRsSecProvToEpg": {
          "attributes": {
            "tDn": "${var.mgmt_domain_dn}"
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
 - Class: "aaaProviderRef"
 - Distinguished Name: "uni/userext/tacacsext/tacacsplusprovider-{Provider Group}"
GUI Location:
 - Admin > AAA > Authentication
*/
resource "aci_rest" "tacacs_provider_group" {
  depends_on = [aci_rest.tacacs_provider]
  path       = "/api/node/mo/uni/userext/tacacsext/tacacsplusprovidergroup-${var.tacacs_provider_group}.json"
  class_name = "aaaProviderRef"
  payload    = <<EOF
{
  "aaaProviderRef": {
    "attributes": {
      "annotation": "${var.annotation_prov_grp}",
      "descr": "${var.descr_prov_grp}",
      "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-${var.tacacs_provider_group}/providerref-${var.hostname}",
      "name": "${var.hostname}",
      "nameAlias": "${var.name_alias_prov_grp}",
      "order": "${var.priority}",
    }
  }
}
  EOF
}
