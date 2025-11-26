variable "bastions" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    ip_configuration = map(object({
      name = string
    }))
  }))
}
