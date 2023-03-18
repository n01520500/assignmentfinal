
variable "resource_group_name" {
  type = string
}

variable "vm_count" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "storage_account_type" {
    default = "Standard_LRS"
}

variable "vmlinux_name" {
    default = ""
}

variable "linux_vm_ids" {
  type = list(string)
}

variable "vmwindows_id" {
  type = string
}


variable "disk_size" {
    default = 10
}

variable "lun" {
    default = 0
}

variable "depend_on" {
    default = ""
}

variable "create" {
    default = "Empty"
}

variable "data_disk_caching" {
    default = "ReadWrite"
}

variable "tags" {
  type        = map(string)
  default = {
    Project        = "Automation Project – Assignment 1"
    Name           = "kavya.sharma"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}
