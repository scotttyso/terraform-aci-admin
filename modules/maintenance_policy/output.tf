output "maintenance_policy" {
  description = "This output will provide the Distinguished Name of the Maintenance Policy."
  value       = aci_maintenance_policy.maintenance_policy.id
}
