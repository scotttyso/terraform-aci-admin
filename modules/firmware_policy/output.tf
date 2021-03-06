output "firmware_policy" {
  description = "This output will provide the Distinguished Name of the Firmware Policy."
  value       = aci_firmware_policy.firmware_policy.id
}
