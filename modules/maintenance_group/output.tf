output "maintenance_group" {
  description = "This output will provide the Distinguished Name of the Firmware Group."
  value       = aci_pod_maintenance_group.maintenance_group.id
}
