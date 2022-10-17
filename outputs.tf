output "id" {
  value       = var.create_private_zone == true ? azurerm_private_dns_zone.this[0].id : ""
  description = "Private DNS Zone Id"
}

output "name" {
  value       = var.create_private_zone == true ? azurerm_private_dns_zone.this[0].name : ""
  description = "Private DNS Zone Name"
}

output "link_id" {
  value       = var.vnet_map == {} ? [] : [ for vnet_link in azurerm_private_dns_zone_virtual_network_link.this : vnet_link.id ]
  description = "List of Virtual Network Link Ids"
}
