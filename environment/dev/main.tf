module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}

module "stgs" {
  depends_on = [module.rg, module.vnet]
  source     = "../../modules/azurerm_storage_account"
  stgs       = var.stgs
}

module "sqlserver" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_sql_server"
  sql_server = var.sql_server
}

module "database" {
  depends_on = [module.sqlserver]
  source     = "../../modules/azurerm_sql_database"
  databases  = var.databases
  serverdata = var.serverdata
}

module "azure_container_registory" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_containser_registory"
  acrs       = var.acrs
}

module "keyvault" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_keyvault"
  kvs        = var.kvs
}

module "kubecluster" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_kubernets_cluster"
  clusters   = var.clusters
}

module "publicip" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_public_ip"
  pips       = var.pips
}

module "vms" {
  depends_on = [module.rg, module.vnet]
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.vms
  subnet_ids = module.subnet.subnet_ids
  pip_ids    = module.publicip.pip_ids
}

module "bastion" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_bastion"
  bastions   = var.bastions
}

# module "roleassignment" {
#   source = "../../modules/azurerm_managed_identity"
# }