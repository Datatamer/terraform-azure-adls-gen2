output "storage_account_id" {
  value       = azurerm_storage_account.adls-gen2-storage.id
  description = "ID of the ADLS Gen2 storage account"
}

output "storage_account_name" {
  value       = azurerm_storage_account.adls-gen2-storage.name
  description = "Name of the ADLS Gen2 storage account"
}

output "storage_account_primary_access_key" {
  value       = azurerm_storage_account.adls-gen2-storage.primary_access_key
  description = "Primary access key for the ADLS Gen2 storage account"
}

output "storage_account_primary_connection_string" {
  value       = azurerm_storage_account.adls-gen2-storage.primary_connection_string
  description = "Primary connection string for the ADLS Gen2 storage account"
}

output "storage_account_primary_dfs_enpoint" {
  value       = azurerm_storage_account.adls-gen2-storage.primary_dfs_endpoint
  description = "Primary DFS endpoint for the ADLS Gen2 storage account"
}

output "storage_account_primary_dfs_host" {
  value       = azurerm_storage_account.adls-gen2-storage.primary_dfs_host
  description = "Hostname and port for DFS storage for the ADLS Gen2 storage account"
}

output "gen2_fs_id" {
  value       = azurerm_storage_data_lake_gen2_filesystem.adls-gen2.id
  description = "ID of the ADLS Gen2 filesystem"
}

output "gen2_fs_name" {
  value       = azurerm_storage_data_lake_gen2_filesystem.adls-gen2.name
  description = "Name of the ADLS Gen2 filesystem"
}
