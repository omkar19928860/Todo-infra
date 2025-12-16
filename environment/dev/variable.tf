variable "resource_group" {
  description = "Resource group configuration code"
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))
}
variable "storage_account" {
  type = map(object({
    name                             = string
    resource_group_name              = string
    location                         = string
    account_tier                     = string
    account_replication_type         = string
    account_kind                     = optional(string)
    cross_tenant_replication_enabled = optional(bool)
    access_tier                      = optional(string)
    edge_zone                        = optional(string)
    https_traffic_only_enabled       = optional(bool)
    min_tls_version                  = optional(string)
  }))
}
variable "virtual_network" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })))
  }))
}
variable "pip" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    allocation_method    = string
    ddos_protection_mode = optional(string)
    tags                 = optional(map(string))
  }))
}
variable "nic" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    virtual_network_name = string
    subnet_name          = string
    auxiliary_sku        = optional(string)
    auxiliary_mode       = optional(string)
    tags                 = optional(map(string))
    ip_configurations = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}

variable "keyvault" {
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
variable "secrets" {
  type = map(object({
    key_name            = string
    resource_group_name = string
    secret_name         = string
    secret_value        = string
  }))
}
variable "vms" {
  type = map(object({
    vm_name             = string
    location            = string
    resource_group_name = string
    size                = string
    key_name            = string
    secret_name         = string
    secret_value        = string
    nic_name            = string
    os_disk = list(object({
      caching              = string
      storage_account_type = string
    }))
    source_image_reference = list(object({
      publisher = string
      version   = string
      sku       = string
      offer     = string
    }))
  }))
}
