output "login_domain_radius" {
  description = "This output will provide the Distinguished Name of the RADIUS Login Domain."
  value       = aci_rest.login_domain_radius.id
}
