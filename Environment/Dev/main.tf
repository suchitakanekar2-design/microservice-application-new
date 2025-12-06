module "rg" {
  source     = "../../Modules/azurerm_resource_group"
  rg_details = var.rg_details

}

module "storage_account" {
  depends_on      = [module.rg]
  source          = "../../Modules/azurerm_storage_account"
  storage_details = var.storage_details

}

module "vnet" {
  depends_on   = [module.rg]
  source       = "../../Modules/azurerm_virtual_network"
  vnet_details = var.vnet_details
}

# module "pip" {
#   depends_on  = [module.rg]
#   source      = "../../Modules/azurerm_public_ip"
#   pip_details = var.pip_details
# }

# module "virtual_machine" {
#   depends_on = [module.rg]
#   source     = "../../Modules/azurerm_virtual_machine"
#   vms        = var.vms

# }


module "azure_conatiner_registry" {
  depends_on  = [module.rg]
  source      = "../../Modules/azurerm_container_registry"
  acr_details = var.acr_details
}

module "azure_kubernetes_cluster" {
  depends_on  = [module.rg]
  source      = "../../Modules/azurerm_kubernetes_cluster"
  aks_details = var.aks_details
}

module "azure_db_server" {
  depends_on       = [module.rg]
  source           = "../../Modules/azurerm_sql_server"
  dbserver_details = var.dbserver_details

}

module "azure_db" {
  depends_on = [ module.rg ]
  source = "../../Modules/azurerm_sql_database"
  db_details = var.db_details
  
}

module "azure_keyvault" {
  depends_on = [module.rg]
  source     = "../../Modules/azurerm_keyvault"
  key_vaults = var.key_vaults
}
