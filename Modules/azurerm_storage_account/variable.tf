variable "storage_details" {
  type = map(object({
    storage_name             = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string

  }))

}
