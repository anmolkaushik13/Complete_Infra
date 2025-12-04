variable "subnets" {
  type = map(object({
    name                = string
    resource_group_name = string
    vnet                = string
    address_prefixes    = list(string)
  }))
}
