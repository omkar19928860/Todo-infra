resource "azurerm_storage_account" "storage_account" {
  for_each                         = var.storage_account
  name                             = each.value.name
  resource_group_name              = each.value.resource_group_name
  location                         = each.value.location
  account_tier                     = each.value.account_tier
  account_replication_type         = each.value.account_replication_type
  account_kind                     = each.value.account_kind
  cross_tenant_replication_enabled = each.value.cross_tenant_replication_enabled
  access_tier                      = each.value.access_tier
  edge_zone                        = each.value.edge_zone
  https_traffic_only_enabled       = each.value.https_traffic_only_enabled
  min_tls_version                  = each.value.min_tls_version
}
