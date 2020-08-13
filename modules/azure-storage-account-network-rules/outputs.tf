output "network_rules_id" {
  value       = azurerm_storage_account_network_rules.adls-gen2-rules.id
  description = "ID of the ADLS Gen2 storage account network rules"
}
