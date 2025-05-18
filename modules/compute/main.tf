resource "azurerm_network_interface" "nic" {
  name                = "demo-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_public_ip" "public_ip" {
  name                = "demo-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "demo-vm"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = "Standard_B1s"
  admin_username        = var.vm_admin_username
  admin_password        = var.vm_admin_password
  network_interface_ids = [azurerm_network_interface.nic.id]
  disable_password_authentication = false

  provisioner "remote-exec" {
    inline = [
      "curl -s https://raw.githubusercontent.com/datadog/datadog-agent/master/cmd/agent/install_script.sh | DD_API_KEY=${var.datadog_api_key} bash"
    ]
  }
}
