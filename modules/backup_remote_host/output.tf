output "remote_host" {
  description = "This output will provide the DN of the Remote Host Policy."
  value       = aci_rest.remote_host.id
}
