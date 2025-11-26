data "azurerm_mssql_server" "datasql" {
  for_each            = var.serverdata
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}