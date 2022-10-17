resource "azurerm_private_dns_zone" "this" {
  count = var.create_private_zone == true ? 1 : 0

  name                = var.dns_zone_name
  resource_group_name = var.resource_group
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each = var.vnet_map == {} ? {} : { for k, v in var.vnet_map : k => v }

  name                  = "link-${each.key}"
  private_dns_zone_name = var.create_private_zone == true ? azurerm_private_dns_zone.this[0].name : var.external_dns_zone_name
  resource_group_name   = var.resource_group
  virtual_network_id    = each.value
  tags                  = var.tags
}
