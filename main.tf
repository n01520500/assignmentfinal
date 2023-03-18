
#Resource Group
module "rgroup" {
  source = "./modules/rgroup"
  location = "eastus"
  tags     = var.tags
  resource_group_name = "N01520500-assignment1-RG"
}

#Network Module
module "network" {
  source = "./modules/network"
  resource_group_name = "N01520500-assignment1-RG"
 location = "eastus"  
 subnet_name         = "0500-subnet"
 vnet_space = "10.0.0.0/16"
 nsg    = "nsg"
}



#Common Module
module "common" {
  source = "./modules/common"
  resource_group_name = "N01520500-assignment1-RG"
  storage_account   = "0500storageaccount"
  la_workspace      = {
    name = "la_workspace0500"
    sku  = "PerGB2018"
  }
  vault             = {
    name = "0500keyvault"
    sku  = "Standard"
  }
  
  location = "eastus"
}

# Linux Module
module "vmlinux" {
  source   = "./modules/vmlinux"
  vm_count = 2
  vmlinux_name  = "my-linux-vm0500"
  vm_size  = "Standard_B1s"
  ssh_user = "centos"
  resource_group_name = "N01520500-assignment1-RG"
  location = "eastus"
  
  #ssh_private_key_path = "~/.ssh/id_rsa"

  subnet_id   = module.network.subnet_id
  vnet_name   = module.network.vnet_name
  subnet_name = module.network.subnet_name
  storage_account_uri = module.common.storage_account_uri
}

# Windows Module
module "vm_windows" {
  source                          = "./modules/vmwindows"
  resource_group_name             = "N01520500-assignment1-RG"
  location                        = "eastus"
  subnet_id                       = module.network.subnet_id
  vm_size                         = "Standard_B1s"
  admin_username                  = "Kavya"
  admin_password                  = "Kavya@1101"
  dns_label                       = "public-ipwindows"
  avail_set_name                  = "0500windows-avail-set"
  public_ip_dns_label             = "win0500publicip"
  antimalware_extension_name      = "IaaSAntimalware"
  antimalware_extension_publisher = "Microsoft.Azure.Security"
  antimalware_extension_type      = "IaaSAntimalware"
  antimalware_extension_version   = "1.3"
  boot_diagnostics_storage_uri    = module.common.storage_account_uri

}

#Datadisk Module
module "datadisk" {
  source              = "./modules/datadisk"
  location            = "eastus"
  resource_group_name = "N01520500-assignment1-RG"
  subnet_id           = module.network.subnet_id
  vm_count            = 3
  tags                = var.tags
  linux_vm_ids        = module.vmlinux.vm_ids
  vmwindows_id     = module.vm_windows.vm_id
}

#Loadbalancer Module
module "loadbalancer" {
  source              = "./modules/loadbalancer"
   resource_group_name = "N01520500-assignment1-RG"
  location            = "eastus"
linux_vm_ids = module.vmlinux.vm_ids


}

#Database Module
module "database" {
  source              = "./modules/database"
  location            = "eastus"
  resource_group_name = "N01520500-assignment1-RG"
  admin_username   = "Kavya"
  admin_password   = "Kavya@1101"
  tags                = var.tags
  
}
