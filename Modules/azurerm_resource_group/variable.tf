variable "rg_details" {
  type = map(object({
    rg_name  = string
    location = string

  }))
}
