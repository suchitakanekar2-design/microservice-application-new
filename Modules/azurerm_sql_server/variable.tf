variable "dbserver_details"{
  type = map(object({
    sql_server_name = string
    resource_group_name =string
    location = string
    admin_username = string
    admin_password = string
    tags = optional(map(string))

  }))
}