resource "azurerm_private_dns_zone" "this" {
  count = var.create_private_dns_zone ? 1 : 0

  name                = var.dns_zone_name
  resource_group_name = var.resource_group
  tags                = var.tags
}

resource "azurerm_private_dns_a_record" "example" {
  for_each = {
    for object in var.private_dns_a_records :
    object.name => object
  }

  name                = each.value.name
  zone_name           = try(azurerm_private_dns_zone.this[0].name, var.dns_zone_name)
  resource_group_name = try(azurerm_private_dns_zone.this[0].resource_group_name, var.resource_group)
  ttl                 = each.value.ttl
  records             = each.value.records
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each = var.vnet_map

  name                  = "vnet-link-${each.key}"
  private_dns_zone_name = try(azurerm_private_dns_zone.this[0].name, var.dns_zone_name)
  resource_group_name   = try(azurerm_private_dns_zone.this[0].resource_group_name, var.resource_group)
  virtual_network_id    = each.value
  tags                  = var.tags
}
