resource "azurerm_public_ip" "lb-publicip" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  tags		      = var.tags
}


#Loadbalancer frontend 
resource "azurerm_lb" "loadbalancer" {
  name                = var.loadbalancer["name"]
  location            = var.location
  resource_group_name = var.resource_group_name
  frontend_ip_configuration {
    name                          = "PublicIPAddress"
    public_ip_address_id          = azurerm_public_ip.lb-publicip.id  
 }
   tags = var.tags
}


resource "azurerm_lb_backend_address_pool" "lb_pool_association" {
  count               = 2
  name                = var.vmlinux_name
  loadbalancer_id     = azurerm_lb.loadbalancer.id
  
}

resource "azurerm_lb_probe" "lb_probe" {
  name                = var.lb_probe["name"]
  protocol            = var.lb_probe["protocol"]
  port                = var.lb_probe["port"]
  interval_in_seconds = 5
  number_of_probes    = 2
  request_path        = "/"
  loadbalancer_id     = azurerm_lb.loadbalancer.id
}
