resource "azurerm_resource_group" "adls-gen2-rg" {
  name     = "adlsGen2SpResourceGroup"
  location = "East US 2"
}

resource "azurerm_virtual_network" "adls-gen2-vnet" {
  name = "tamrAdlsGen2ExampleVN"

  location            = azurerm_resource_group.adls-gen2-rg.location
  resource_group_name = azurerm_resource_group.adls-gen2-rg.name

  address_space = ["1.2.3.0/25"]
}

resource "azurerm_subnet" "example-subnet" {
  name = "tamrAdlsGen2ExampleSubnet"

  resource_group_name = azurerm_resource_group.adls-gen2-rg.name

  virtual_network_name = azurerm_virtual_network.adls-gen2-vnet.name
  address_prefixes     = ["1.2.3.0/28"]

  service_endpoints = [
    "Microsoft.Storage",
  ]
}

module "minimal" {
  source = "../../"

  instance_name       = "adlsgen2tamr"
  resource_group_name = azurerm_resource_group.adls-gen2-rg.name
  location            = azurerm_resource_group.adls-gen2-rg.location
}

module "rules" {
  source = "../../modules/azure-storage-account-network-rules"

  storage_account_name = module.minimal.storage_account_name
  resource_group_name  = azurerm_resource_group.adls-gen2-rg.name
  allowed_ips          = ["4.3.2.1"]
  allowed_subnet_ids   = [azurerm_subnet.example-subnet.id]
}

module "service-principal" {
  source = "../../modules/azure-service-principal"

  application_name            = "example-sp"
  client_secr_expiration_date = "2022-01-01T01:02:03Z"
  role_scopes                 = [module.minimal.storage_account_id]
  tags                        = ["sp-example-tag", "WindowsAzureActiveDirectoryIntegratedApp"]
}
