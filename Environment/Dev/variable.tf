variable "rg_details" {
  type = map(object({
    rg_name  = string
    location = string

  }))
}

variable "storage_details" {
  type = map(object({
    storage_name             = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string

  }))

}

variable "vnet_details" {
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = map(object({
      subnet_name      = string
      address_prefixes = list(string)

    }))

  }))
}

# variable "pip_details" {
#   type = map(object({
#     pip_name            = string
#     location            = string
#     resource_group_name = string
#     tags                = optional(map(string))

#   }))
# }

# variable "vms" {
#   type = map(object({
#     nic_name            = string
#     nic_location        = string
#     resource_group_name = string
#     vm_name             = string
#     location            = string
#     size                = string
#     admin_username      = string
#     admin_password      = string
#     pip_name            = string
#     vnet_name           = string
#     subnet_name         = string
#   }))
# }

variable "key_vaults" {
  description = "Map of Key Vault configurations"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
    tags                        = optional(map(string))
    access_policies = optional(list(object({
      # don't accept tenant_id here to reduce mistakes; but keep optional if you must:
      tenant_id               = optional(string)
      object_id               = string
      key_permissions         = optional(list(string))
      secret_permissions      = optional(list(string))
      certificate_permissions = optional(list(string))
      storage_permissions     = optional(list(string))
    })), [])
  }))
}

variable "acr_details" {
  type = map(object({
    acr_name            = string
    location            = string
    resource_group_name = string
    sku                 = string
    admin_enabled       = bool
    tags                = map(string)

  }))

}

variable "aks_details" {
  type = map(object({
    aks_name            = string
    location            = string
    resource_group_name = string
    dns_prefix          = string

    default_node_pool = object({
      node_pool_name = string
      vm_size        = string
      node_count     = number
      tags           = optional(map(string))
    })
  }))
}

variable "db_details" {
  type = map(object({
    name            = string
    server_id       = string
    collation       = string
    license_type    = string
    max_size_gb     = number
    sku_name        = string
    enclave_type    = string
    tags            = map(string)
    prevent_destroy = bool
  }))
}

variable "dbserver_details" {
  type = map(object({
    sql_server_name     = string
    resource_group_name = string
    location            = string
    admin_username      = string
    admin_password      = string
    tags                = optional(map(string))

  }))
}
