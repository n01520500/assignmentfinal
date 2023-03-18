variable "resource_group_name"{
    type = string
} 

variable "location" {
    type = string
}


variable "tags" {
  type = map(string)
}

variable "db_sku_name" {
  default     = "B_Gen5_1"
}

variable "db_storage_mb" {
  default     = 5120
}

variable "admin_username" {
  default = "Kavya"
}

variable "admin_password" {
  default = "Kavya@1101"
}

variable "server_name" {
  type    = string
  default = "my-postgresql-server"
}
