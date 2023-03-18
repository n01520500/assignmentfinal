variable "resource_group_name" {
	default = "N01520500-assignment1-RG"
}

variable "location" {
	default = "eastus"
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

variable "storage_account" {
  type = string
}

variable "la_workspace" {
  type = object({
    name   = string
    sku    = string
  })
}

variable "vault" {
  type = object({
    name = string
    sku  = string
  })
}