resource "azurerm_linux_virtual_machine" "vm" {
  depends_on = [data.azurerm_key_vault_secret.admin_username,data.azurerm_network_interface.nic]
  for_each                        = var.vms
  name                            = each.value.vm_name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  admin_username                  = data.azurerm_key_vault_secret.admin_username[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.admin_password[each.key].value
  disable_password_authentication = false
  size                            = each.value.size

  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]

  dynamic "os_disk" {
    for_each = each.value.os_disk
    content {
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
    }
  }
  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference
    content {
      publisher = source_image_reference.value.publisher
      version   = source_image_reference.value.version
      sku       = source_image_reference.value.sku
      offer     = source_image_reference.value.offer
    }
  }
}

