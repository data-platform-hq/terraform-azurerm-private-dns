output "id" {
  value       = try(azurerm_private_dns_zone.this[0].id, null)
  description = "Private DNS Zone Id"
}

output "name" {
  value       = try(azurerm_private_dns_zone.this[0].name, null)
  description = "Private DNS Zone Name"
}

output "resource_group" {
  value       = try(azurerm_private_dns_zone.this[0].resource_group_name, null)
  description = "Private DNS Zone Resource Group"
}

output "vnet_link_name_to_id_map" {
  value = {
    for k, v in var.vnet_map :
    azurerm_private_dns_zone_virtual_network_link.this[k].name => azurerm_private_dns_zone_virtual_network_link.this[k].id
  }
  description = "Map of Virtual Network Link names to it's ids"
}
