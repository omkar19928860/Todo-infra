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