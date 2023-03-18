
resource "azurerm_resource_group" "rgroup" {
  name     = "N01520500-assignment1-RG"
  location = var.location
  
  tags = {
    Environment    = "Lab"
    ExpirationDate = "2023-06-30"
    Name           = "kavya.sharma"
    Project        = "Automation Project – Assignment 1"
  }
}

