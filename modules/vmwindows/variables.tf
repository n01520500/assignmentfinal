variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    Project        = "Automation Project – Assignment 1"
    Name           = "kavya.sharma"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}

variable "location" {
  default = "eastus"
}

variable "resource_group_name" {
  default = "N01520500-assignment1-RG"
}

variable "subnet_id" {

}

variable "vmwindows_name" {
  default = "vm-windows"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "Kavya"
}

variable "admin_password" {
  default = "Kavya@1101"
}


variable "dns_label" {
  default = "mywindowsvm"
}

variable "avail_set_name" {
  default = "0500windows-avail-set"
}

variable "public_ip_dns_label" {
  default = "public-ip-0500"
}

variable "antimalware_extension_name" {
  default = "IaaSAntimalware"
}

variable "antimalware_extension_publisher" {
  default = "Microsoft.Azure.Security"
}

variable "antimalware_extension_type" {
  default = "IaaSAntimalware"
}

variable "antimalware_extension_version" {
  default = "1.3"
}

variable "boot_diagnostics_storage_uri" {

}


variable windows_os_disk {
    type = map(string)
    default = {
        create_option = "Attach"
        storage_account_type = "StandardSSD_LRS"
        disk_size = 128
        caching = "ReadWrite"
    }
}


variable windows_os {
    type = map(string)
    default = {
        publisher = "MicrosoftWindowsServer"
        offer = "WindowsServer"
        sku = "2016-Datacenter"
        version = "latest"
    }
}