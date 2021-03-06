output "accounting_group" {
  description = "This output will provide the DN of the TACACS+ Accounting Group."
  value       = aci_rest.tacacs_accounting.id
}
