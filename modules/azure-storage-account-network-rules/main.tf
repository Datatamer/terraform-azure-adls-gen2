resource "azurerm_storage_account_network_rules" "adls-gen2-rules" {
  storage_account_name       = var.storage_account_name
  resource_group_name        = var.resource_group_name
  default_action             = "Deny"
  bypass                     = ["AzureServices"]
  ip_rules                   = var.allowed_ips
  virtual_network_subnet_ids = var.allowed_subnet_ids
}
