output "scheduler" {
  description = "This output will provide the DN of the Triggered Scheduler Policy."
  value       = aci_rest.scheduler.id
}
