variable "resource_group_name" {
  default = "N01520500-assignment1-RG"
}

variable "location" {
  default = "eastus"
}

variable "subnet_name" {
  default = "subnet1"
}

variable "tags" {
  type = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    Project = "Automation Project – Assignment 1"
    Name = "kavya.sharma"
    ExpirationDate = "2023-06-30"
    Environment = "Lab"
  }
}

variable "vnet_name" {
  default = "0500vnet"
}

variable "vnet_space" {
  type = string
}

variable "nsg" {
  type = string
}

variable "address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  description = "CIDR block for the subnet."
  default = "10.0.1.0/24"
}


