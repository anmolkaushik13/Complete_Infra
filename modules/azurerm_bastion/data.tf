data "azurerm_subnet" "datasubnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "test_dev-vnet"
  resource_group_name  = "test_dev-rg"
}

data "azurerm_public_ip" "datapublic" {
  name                = "publicip2"
  resource_group_name = "test_dev-rg"
}
