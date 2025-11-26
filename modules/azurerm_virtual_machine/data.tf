data "azurerm_subnet" "datasubnet" {
  name                 = "test_dev_subnet"
  virtual_network_name = "test_dev-vnet"
  resource_group_name  = "test_dev-rg"
}