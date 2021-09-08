data "azurerm_storage_account_sas" "sas_token" {
  connection_string = var.storage_account_primary_connection_string
  https_only        = true
  signed_version    = var.signed_version

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = true
  }

  start  = var.start_time
  expiry = var.end_time

  permissions {
    read    = true
    write   = true
    delete  = var.delete_allowed
    list    = true
    add     = true
    create  = true
    update  = false
    process = false
  }
}
