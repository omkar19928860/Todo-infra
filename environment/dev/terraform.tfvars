resource_group = {
  rg1 = {
    name       = "rg-todo-001"
    location   = "Central India"
    managed_by = "Terraform"
    tags = {
      environment = "dev"
      team        = "todo-team"
    }
  }
  rg2 = {
    name       = "rg-todo-002"
    location   = "Central India"
    managed_by = "Terraform"
    tags = {
      environment = "dev"
      team        = "todo-team"
    }
  }
}
storage_account = {
  stg1 = {
    name                             = "todostaorage00om7"
    resource_group_name              = "rg-todo-001"
    location                         = "central india"
    account_tier                     = "Standard"
    account_replication_type         = "GRS"
    account_kind                     = "StorageV2"
    cross_tenant_replication_enabled = false
    access_tier                      = "Cool"
    https_traffic_only_enabled       = true
    min_tls_version                  = "TLS1_0"
  }
  stg2 = {
    name                     = "todostaorageom8"
    resource_group_name      = "rg-todo-002"
    location                 = "central india"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

virtual_network = {
  vnet1 = {

    name                = "vnet-todo-001"
    location            = "Central India"
    resource_group_name = "rg-todo-001"
    address_space       = ["10.0.0.0/16"]

    subnets = [
      {
        name             = "sub-todo-001"
        address_prefixes = ["10.0.10.0/24"]
      },
      {
        name             = "sub-todo-002"
        address_prefixes = ["10.0.20.0/24"]
      }
    ]
  }
  vnet2 = {

    name                = "vnet-todo-002"
    location            = "Central India"
    resource_group_name = "rg-todo-002"
    address_space       = ["10.0.0.0/16"]

    subnets = [
      {
        name             = "sub-todo-003"
        address_prefixes = ["10.0.30.0/24"]
      }
    ]
  }
}

pip = {
  pip1 = {
    name                 = "pip-todo-001"
    resource_group_name  = "rg-todo-001"
    location             = "Central India"
    allocation_method    = "Static"
    ddos_protection_mode = "Disabled"
    tags = {
      environment = "dev"
      team        = "todo-team"
    }
  }
  pip2 = {
    name                 = "pip-todo-002"
    resource_group_name  = "rg-todo-002"
    location             = "Central India"
    allocation_method    = "Static"
    ddos_protection_mode = "Disabled"
  }
}

nic = {
  nic1 = {
    name                 = "nic-todo-001"
    location             = "Central india"
    resource_group_name  = "rg-todo-001"
    subnet_name          = "sub-todo-001"
    virtual_network_name = "vnet-todo-001"
    auxiliary_sku        = "None"
    auxiliary_mode       = "None"
    ip_configurations = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
  nic2 = {
    name                 = "nic-todo-002"
    location             = "Central india"
    resource_group_name  = "rg-todo-002"
    subnet_name          = "sub-todo-003"
    virtual_network_name = "vnet-todo-002"
    auxiliary_sku        = "None"
    auxiliary_mode       = "None"
    ip_configurations = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}

keyvault = {
  key1 = {
    name                        = "keyvault001osslmo"
    resource_group_name         = "rg-todo-001"
    location                    = "Central india"
    enabled_for_disk_encryption = "true"
    soft_delete_retention_days  = "7"
    purge_protection_enabled    = "false"
    sku_name                    = "standard"
  }
  key2 = {
    name                        = "keyvault002osslmo"
    resource_group_name         = "rg-todo-002"
    location                    = "Central india"
    enabled_for_disk_encryption = "true"
    soft_delete_retention_days  = "7"
    purge_protection_enabled    = "false"
    sku_name                    = "standard"
  }
}

secrets = {
  secret1 = {
    key_name            = "keyvault001osslmo"
    resource_group_name = "rg-todo-001"
    secret_name         = "vm1"
    secret_value        = "Ali@1001"
  }
  secret2 = {
    key_name            = "keyvault001osslmo"
    resource_group_name = "rg-todo-001"
    secret_name         = "password1"
    secret_value        = "Ali@1002"
  }
  secret3 = {
    key_name            = "keyvault002osslmo"
    resource_group_name = "rg-todo-002"
    secret_name         = "vm2"
    secret_value        = "Ali@1003"
  }
  secret4 = {
    key_name            = "keyvault002osslmo"
    resource_group_name = "rg-todo-002"
    secret_name         = "password2"
    secret_value        = "Ali@1004"
  }
}

vms = {
  vm1 = {
    vm_name             = "vm-todo-001oss"
    resource_group_name = "rg-todo-001"
    location            = "central india"
    size                = "Standard_D2s_v3"
    nic_name            = "nic-todo-001"
    key_name            = "keyvault001osslmo"
    secret_name         = "vm1"
    secret_value        = "password1"
    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]
    source_image_reference = [
      {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    ]
  }
  vm2 = {
    vm_name             = "vm-todo-002oss"
    resource_group_name = "rg-todo-002"
    location            = "central india"
    size                = "Standard_D2s_v3"
    nic_name            = "nic-todo-002"
    key_name            = "keyvault002osslmo"
    secret_name         = "vm2"
    secret_value        = "password2"
    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]
    source_image_reference = [
      {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    ]
  }
}

