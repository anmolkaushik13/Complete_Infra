resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name


  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration != null ? each.value.ip_configuration : {}

    content {
      name                 = ip_configuration.value.name
      subnet_id            = var.subnet_ids["sub1"]
      public_ip_address_id = var.pip_ids["pip1"]

      # subnet_id                     = data.azurerm_subnet.datasubnet.id
      # public_ip_address_id          = data.azurerm_public_ip.datapublic.id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    }
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each              = var.vms
  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  size                  = each.value.size
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  admin_username        = each.value.admin_username
  admin_password        = "StrongPassword123!"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}
