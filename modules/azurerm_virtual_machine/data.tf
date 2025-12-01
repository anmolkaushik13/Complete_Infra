# data "azurerm_subnet" "datasubnet" {
#   name                 = "test_dev_subnet"
#   virtual_network_name = "test_dev_vnet"
#   resource_group_name  = "test_dev_rg"
# }

# data "azurerm_public_ip" "datapublic" {
#   name                = "publicip1"
#   resource_group_name = "test_dev_rg"
# }

output "subnet_ids" {
  value = { for k, s in azurerm_subnet.subnet : k => s.id }
}

output "pip_ids" {
  value = { for k, p in azurerm_public_ip.pip : k => p.id }
}
