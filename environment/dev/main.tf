module "resource_group" {
  source         = "../../module/azurerm_resourse_group"
  resource_group = var.resource_group
}
module "storage_account" {
  source          = "../../module/azurerm_storage_account"
  depends_on      = [module.resource_group]
  storage_account = var.storage_account
}
module "virtual_network" {
  source          = "../../module/azurerm_virtual_network"
  depends_on      = [module.resource_group]
  virtual_network = var.virtual_network
}
module "pip" {
  source     = "../../module/azurerm_public_ip"
  depends_on = [module.resource_group]
  pip        = var.pip
}
module "nic" {
  source     = "../../module/azurerm_network_interface"
  depends_on = [module.resource_group, module.virtual_network]
  nic        = var.nic
}
module "key_vault" {
  source = "../../module/azurerm_key_vault"
  depends_on = [ module.resource_group ]
  keyvault = var.keyvault
}
module "secrets" {
  source     = "../../module/azurerm_secret"
  depends_on = [module.key_vault]
  secrets    = var.secrets
}
module "vms" {
  source = "../../module/azurerm_virtual_machine"
  depends_on = [ module.virtual_network , module.nic, module.pip, module.secrets ]
  vms = var.vms
}

