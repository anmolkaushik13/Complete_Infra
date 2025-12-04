output "pip_ids" {
  value = { for k, p in azurerm_public_ip.pip : k => p.id }
}
