resource "azurerm_resource_group" "adls-gen2-rg" {
  name     = "adlsGen2ResourceGroup"
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

  name                    = "adlsgen2tamr"
  resource_group_name     = azurerm_resource_group.adls-gen2-rg.name
  resource_group_location = azurerm_resource_group.adls-gen2-rg.location
  allowed_ips             = ["4.3.2.1"]
  allowed_subnet_ids      = [azurerm_subnet.example-subnet.id]
}
