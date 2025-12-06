# resource "azurerm_network_interface" "nic" {
#   for_each = var.vms

#   name                = each.value.nic_name
#   location            = each.value.nic_location
#   resource_group_name = each.value.resource_group_name
#   ip_configuration {
#     name                          = "internal"
#     private_ip_address_allocation = "Dynamic"
#     subnet_id                     = data.azurerm_subnet.subnet[each.key].id
#     public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
#   }
# }


# resource "azurerm_linux_virtual_machine" "linux_vm" {
#   for_each                        = var.vms
#   name                            = each.value.vm_name
#   location                        = each.value.location
#   resource_group_name             = each.value.resource_group_name
#   disable_password_authentication = false
#   size                            = each.value.size
#   admin_username                  = each.value.admin_username
#   admin_password                  = each.value.admin_password
#   network_interface_ids = [
#     azurerm_network_interface.nic[each.key].id
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }
#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }
