variable "sql_server" {
  type = map(object({
    name                         = string
    location                     = string
    resource_group_name          = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
  }))
}
