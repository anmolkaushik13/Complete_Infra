
resource "azurerm_role_assignment" "roleassignment" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_client_config.example.object_id
}