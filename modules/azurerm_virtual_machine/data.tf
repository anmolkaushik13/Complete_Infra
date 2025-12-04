# data "azurerm_subnet" "datasubnet" {
#   name                 = "test_dev_subnet"
#   virtual_network_name = "test_dev_vnet"
#   resource_group_name  = "test_dev_rg"
# }

# data "azurerm_public_ip" "datapublic" {
#   name                = "publicip1"
#   resource_group_name = "test_dev_rg"
# }