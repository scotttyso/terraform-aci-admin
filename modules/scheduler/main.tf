#----------------------------------------------------
# Create a Backup Scheduler for Configuration Export
#----------------------------------------------------

/*
API Information:
 - Class: "trigSchedP"
 - Distinguished Name: "uni/fabric/schedp-{Name}"
GUI Location:
 - Admin > Schedulers > Fabric > {Name}
*/
resource "aci_rest" "scheduler" {
  path       = "/api/node/mo/uni/fabric/schedp-${var.name_scheduler}.json"
  class_name = "trigSchedP"
  payload    = <<EOF
{
  "trigSchedP": {
    "attributes": {
      "annotation": "${var.annotation_scheduler}",
      "descr": "${var.description}",
      "dn": "uni/fabric/schedp-${var.name_scheduler}",
      "name": "${var.name_scheduler}",
      "nameAlias": "${var.name_alias_scheduler}"
    },
    "children": [
      {
        "trigRecurrWindowP": {
          "attributes": {
            "annotation": "${var.annotation_window}",
            "concurCap": "${var.max_concurrent_nodes}",
            "day": "${var.days}",
            "dn": "uni/fabric/schedp-${var.name_scheduler}/recurrwinp-${local.name_window}",
            "hour": "${var.hour}",
            "minute": "${var.minute}",
            "name": "${local.name_window}",
            "nameAlias": "${var.name_alias_window}",
            "procCap": "${var.max_running_time}"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}

