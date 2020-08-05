resource "azurerm_storage_account" "adls-gen2-storage" {
  // Name must be lowercase and numbers only, must be fewer than 18 characters
  name                = "${var.name}storage"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  account_replication_type = var.replication_type
  account_kind             = var.account_kind
  access_tier              = var.access_tier

  enable_https_traffic_only = "true"

  is_hns_enabled = "true"     // must be true for ADLS Gen2
  account_tier   = "Standard" // must be Standard for HNS enabled
}

resource "azurerm_storage_data_lake_gen2_filesystem" "adls-gen2" {
  name               = var.name
  storage_account_id = azurerm_storage_account.adls-gen2-storage.id

  properties = var.fs_properties
}

resource "azurerm_storage_account_network_rules" "adls-gen2-rules" {
  storage_account_name       = azurerm_storage_account.adls-gen2-storage.name
  resource_group_name        = var.resource_group_name
  default_action             = "Deny"
  bypass                     = ["AzureServices"]
  ip_rules                   = var.allowed_ips
  virtual_network_subnet_ids = var.allowed_subnet_ids
}
