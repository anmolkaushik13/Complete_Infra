resource "azurerm_container_registry" "acr" {
  for_each            = var.acrs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled

  dynamic "georeplications" {
    for_each = each.value.georeplications != null ? each.value.georeplications : {}

    content {
      location                = georeplications.value.location
      zone_redundancy_enabled = georeplications.value.zone_redundancy_enabled
      tags                    = {}
    }
  }
}
