resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bastions
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration != null ? each.value.ip_configuration : {}

    content {
      name                 = ip_configuration.value.name
      subnet_id            = data.azurerm_subnet.datasubnet.id
      public_ip_address_id = data.azurerm_public_ip.datapublic.id
    }
  }
}
