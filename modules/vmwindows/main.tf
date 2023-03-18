#Windows VM Network interface
resource "azurerm_network_interface" "vm_nic" {
  name                = "0500vm-nic-windows"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "vm-ip-config-windows"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_windows_public_ip.id
  }
}

resource "azurerm_virtual_machine" "vm_windows" {
  storage_image_reference {
    publisher = var.windows_os["publisher"]
    offer     = var.windows_os["offer"]
    sku       = var.windows_os["sku"]
    version   = var.windows_os["version"]
  }

  storage_os_disk {
    name                 = "${var.vmwindows_name}-os-disk"
    caching              = var.windows_os_disk["caching"]
    storage_account_type = var.windows_os_disk["storage_account_type"]
    disk_size_gb = var.windows_os_disk["disk_size"]
  }


  tags 			= var.tags
  name                  = var.vmwindows_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  vm_size               = var.vm_size



  availability_set_id = azurerm_availability_set.windows_avail_set.id

  boot_diagnostics {
    enabled     = true
    storage_uri = var.boot_diagnostics_storage_uri
  }
}

resource "azurerm_public_ip" "vm_windows_public_ip" {
  name                = "0500vm-windows-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  domain_name_label   = var.public_ip_dns_label

  tags = var.tags
}

resource "azurerm_availability_set" "windows_avail_set" {
  name                = var.avail_set_name
  location            = var.location
  resource_group_name = var.resource_group_name

  platform_fault_domain_count   = 2
  platform_update_domain_count = 2

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "vm_windows_extension" {
  virtual_machine_id   = azurerm_virtual_machine.vm_windows.id
  name                 = var.antimalware_extension_name
  publisher            = var.antimalware_extension_publisher
  type                 = var.antimalware_extension_type
  type_handler_version = var.antimalware_extension_version
  auto_upgrade_minor_version = true

  depends_on = [
    azurerm_virtual_machine.vm_windows
  ]
}
