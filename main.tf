resource "azurerm_private_dns_zone" "this" {
  count = length(var.dns_zone_name) == 0 ? 0 : 1

  name                = var.dns_zone_name
  resource_group_name = var.resource_group
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each = var.vnet_map

  name                  = "link-${each.key}"
  private_dns_zone_name = length(var.dns_zone_name) == 0 ? var.external_dns_zone_name : azurerm_private_dns_zone.this[0].name
  resource_group_name   = var.resource_group
  virtual_network_id    = each.value
  tags                  = var.tags
}
