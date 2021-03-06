output "firmware_group" {
  description = "This output will provide the Distinguished Name of the Firmware Group."
  value       = aci_firmware_group.firmware_group.id
}
