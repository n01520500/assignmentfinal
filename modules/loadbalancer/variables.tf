variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

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

variable "loadbalancer" {
    type = map(string) 
    default = {
        name    = "lb-0500"
        frontend_config = "publicip0500"
    }
}

variable "vmlinux_name" {
    default = ""
}

variable "linux_vm_ids"{
   type = string
}

variable "linux_networkid" {
    default = ""
}

variable "linux_networkint_name" {
    default = ""
}

variable "linux_pip_id" {
    default = ""
}


variable "backend_pool_name" {
  default = "backend-pool-0500"
}

variable "lb_pool_association" {
    default = "poolassociation-0500"
}

variable "lb_publicip" {
    default = "publicip0500"
}

variable "lb_portrule" {
    type = map(string) 
    default = {
        name = "lb0500"
        protocol = "Tcp"
    }
}

variable "lb_probe" {
    type = map(string)
    default = {
        name                = "lbprobe-0500"
        protocol            = "Tcp"
        port                = 80
    }
}

