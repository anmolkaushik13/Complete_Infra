resource "azurerm_mssql_database" "database" {
  for_each     = var.databases
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.datasql[each.value.server_key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
}
