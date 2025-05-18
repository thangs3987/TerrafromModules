module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  vm_admin_username   = var.vm_admin_username
  vm_admin_password   = var.vm_admin_password
}