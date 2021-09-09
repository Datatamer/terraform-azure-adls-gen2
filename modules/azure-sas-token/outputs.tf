output "sas_url_query_string" {
  description = "Token for client usage"
  value       = data.azurerm_storage_account_sas.sas_token.sas
  sensitive   = true
}
