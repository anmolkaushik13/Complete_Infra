rgs = {
  rg1 = {
    name     = "test_dev-rg"
    location = "centralindia"
  }
}

vnets = {
  "vnet1" = {
    name                = "test_dev_vnet"
    location            = "centralindia"
    resource_group_name = "test_dev-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  "sub1" = {
    name                = "test_dev_subnet"
    resource_group_name = "test_dev-rg"
    address_prefixes    = ["10.0.1.0/24"]
    vnet                = "test_dev_vnet"
  }
  "sub2" = {
    name                = "AzureBastionSubnet"
    resource_group_name = "test_dev-rg"
    address_prefixes    = ["10.0.1.0/26"]
    vnet                = "test_dev_vnet"
  }
}

stgs = {
  "std1" = {
    name                     = "stddev"
    resource_group_name      = "test_dev-rg"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

sql_server = {
  "server1" = {
    name                         = "sqlserveranmol123"
    resource_group_name          = "test_dev-rg"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = "testlogin"
    administrator_login_password = "Test@login123"
    minimum_tls_version          = "1.2"
  }
}

serverdata = {
  "server1" = {
    name                = "sqlserveranmol123"
    resource_group_name = "test_dev-rg"
  }
}

databases = {
  "db1" = {
    name         = "sqldatabase"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
    server_key   = "server1"
  }
}

acrs = {
  "acr1" = {
    name                = "testacrdev"
    location            = "centralindia"
    resource_group_name = "test_dev-rg"
    sku                 = "Premium"
    admin_enabled       = false
    georeplications = {
      "rep1" = {
        location                = "East US"
        zone_redundancy_enabled = true
      }
    }
  }

}

kvs = {
  kv1 = {
    name                        = "testdevleyvault"
    location                    = "centralindia"
    resource_group_name         = "test_dev-rg"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
  }
}

clusters = {
  "cluster1" = {
    name                = "kubecluster"
    location            = "centralindia"
    resource_group_name = "test_dev-rg"
    dns_prefix          = "testakc"

    default_node_pool = {
      pool1 = {
        name       = "default"
        node_count = 1
        vm_size    = "Standard_D2_v2"
      }
    }
  }
}

pips = {
  "pip1" = {
    name                = "publicip1"
    location            = "centralindia"
    resource_group_name = "test_dev-rg"
    allocation_method   = "Static"
  }
  "pip2" = {
    name                = "publicip2"
    location            = "centralindia"
    resource_group_name = "test_dev-rg"
    allocation_method   = "Static"
  }
}

vms = {
  "nic1" = {
    nic_name            = "nic1"
    location            = "centralindia"
    resource_group_name = "test_dev-rg"
    vm_name             = "testdevvm"
    size                = "Standard_F2"
    admin_username      = "testuser"

    ip_configuration = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}

bastions = {
  "bastion1" = {
    name                = "bastion"
    location            = "centralindia"
    resource_group_name = "test_dev-rg"
    ip_configuration = {
      config = {
        name = "configuration"
      }
    }
  }
}
