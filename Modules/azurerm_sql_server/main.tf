
resource "azurerm_mssql_server" "dbserver" {
    for_each = var.dbserver_details
  name                         = each.value.sql_server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.admin_username
  administrator_login_password = each.value.admin_password
  minimum_tls_version          = "1.2"

  tags =  each.value.tags
}


