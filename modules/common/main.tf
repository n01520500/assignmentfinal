resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = "la-workspace0500"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.la_workspace["sku"]
  tags                = var.tags
}

# Recovery Services Vault
resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = "recovery-vault0500"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.vault["sku"]
  tags                = var.tags
}

#Storage account
resource "azurerm_storage_account" "storage_account" {
  name                     = "0500storageaccount"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = var.tags
}
