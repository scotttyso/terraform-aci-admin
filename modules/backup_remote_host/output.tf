output "remote_host" {
  description = "This output will provide the Distinguished Name of the Remote Host Policy."
  value       = aci_rest.remote_host.id
}
