resource "azurerm_mssql_server" "sqlserver" {
  for_each                     = var.sql_server
  name                         = each.value.name
  location                     = each.value.location
  resource_group_name          = each.value.resource_group_name
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version
}
