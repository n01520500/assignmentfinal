
#Resource group 
output "resource_group_name" {
  value = module.rgroup.resource_group_name
}

#Network Module
output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "la_workspace_name" {
  value = module.common.la_workspace_name
}

output "rs_vault_name" {
  value = module.common.rs_vault_name
}

#Common module
output "storage_account_name" {
  value = module.common.storage_account_name
}


#Windows
output "vm_windows_hostname" {
  value     = module.vm_windows.vm_hostname
  sensitive = true
}

output "vm_windows_private_ip" {
  value = module.vm_windows.vm_private_ip_address
}

output "vm_windows_public_ip" {
  value = module.vm_windows.vm_public_ip_address
}

output "vmwindows_vm_id" {
  value = module.vm_windows.vm_id
}

output "vm_hostnames" {
  value = module.vmlinux.vm_hostnames
}

output "vm_domains" {
  value = module.vmlinux.vm_domain_names
}

output "vm_private_ips" {
  value = module.vmlinux.vm_private_ips
}

output "vm_public_ips" {
  value = module.vmlinux.vm_public_ips
}

#Linux 
output "linux_vm_ids" {
  value = module.vmlinux.vm_ids
}

#Load Balancer 
output "load_balancer_name" {
  value = module.loadbalancer
}

#Database 
output "database_name" {
  value = module.database.database_name
}