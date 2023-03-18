#dbsql server 
resource "azurerm_postgresql_server" "sql_server" {
  name                         = var.server_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = "10.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  sku_name                     = var.db_sku_name
  storage_mb                   = var.db_storage_mb
  ssl_enforcement_enabled = true
  tags = var.tags

}
