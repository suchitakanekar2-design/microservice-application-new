variable "pip_details"{
 type = map(object({
    pip_name            = string
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}
