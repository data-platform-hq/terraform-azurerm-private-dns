output "id" {
  value       = length(var.dns_zone_name) == 0 ? "" : azurerm_private_dns_zone.this[0].id
  description = "Private DNS Zone Id"
}

output "name" {
  value       = length(var.dns_zone_name) == 0 ? "" : azurerm_private_dns_zone.this[0].name
  description = "Private DNS Zone Name"
}

output "resource_group" {
  value       = length(var.dns_zone_name) == 0 ? "" : azurerm_private_dns_zone.this[0].resource_group_name
  description = "Private DNS Zone Resource Group"
}

output "link_id" {
  value       = length(var.vnet_map) == 0 ? [] : [for vnet_link in azurerm_private_dns_zone_virtual_network_link.this : vnet_link.id]
  description = "List of Virtual Network Link Ids"
}
