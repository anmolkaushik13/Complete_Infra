variable "rgs" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    name                = string
    resource_group_name = string
    vnet                = string
    address_prefixes    = list(string)
  }))
}

variable "stgs" {
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    account_tier             = string
    account_replication_type = string
  }))
}

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

variable "serverdata" {
  type = map(object({
    name                = string
    resource_group_name = string
  }))
}

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

variable "kvs" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
  }))
}

variable "clusters" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string

    default_node_pool = map(object({
      name       = string
      node_count = number
      vm_size    = string
    }))
  }))
}

variable "pips" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}


variable "vms" {
  type = map(object({
    vm_name             = string
    location            = string
    resource_group_name = string
    size                = string
    admin_username      = string
    nic_name            = string
    ip_configuration = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}

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
