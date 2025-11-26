variable "acrs" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    admin_enabled       = bool
    georeplications = map(object({
      location                = string
      zone_redundancy_enabled = bool
    }))
  }))
}
