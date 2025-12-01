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


