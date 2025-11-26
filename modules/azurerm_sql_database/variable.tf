
variable "databases" {
  type = map(object({
    name         = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
    server_key   = string
  }))
}

variable "serverdata" {
  type = map(object({
    name                = string
    resource_group_name = string
  }))
}
