
resource "azurerm_managed_disk" "data_disk" {
  count         = 3
  name          = var.vmlinux_name
  location      = var.location
  resource_group_name = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option = var.create
  depends_on = [var.depend_on]
  tags	     = var.tags
}

#Linux data disk
resource "azurerm_virtual_machine_data_disk_attachment" "linux_data_disk" {
  count          = 2
  managed_disk_id = element(azurerm_managed_disk.data_disk.*.id, count.index)
  virtual_machine_id = element(var.linux_vm_ids, count.index)
  lun               = var.lun
  caching           = var.data_disk_caching
}

#Windows data disk
resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_windows" {
  managed_disk_id = azurerm_virtual_machine_data_disk_attachment.data_disk_windows.id
  virtual_machine_id = var.vmwindows_id
  lun               = var.lun
  caching           = var.data_disk_caching

}


# Windows attachment
resource "azurerm_virtual_machine_data_disk_attachment" "windows_attachment" {
  managed_disk_id      = azurerm_virtual_machine_data_disk_attachment.data_disk_windows.id
  virtual_machine_id   = var.vmwindows_id
  lun                  = var.lun
  caching              = var.data_disk_caching
  depends_on = [azurerm_virtual_machine_data_disk_attachment.data_disk_windows]
}