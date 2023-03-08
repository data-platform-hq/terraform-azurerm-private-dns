locals {
  prefix                     = length(var.prefix) == 0 ? "" : "${var.prefix}-"
  private_dns_zone_vnet_link = var.custom_dns_zone_vnet_link_name == null ? "link-${local.prefix}${each.key}" : "${local.prefix}${var.custom_dns_zone_vnet_link_name}"
}

resource "azurerm_private_dns_zone" "this" {
  count = length(var.dns_zone_name) == 0 ? 0 : 1

  name                = var.dns_zone_name
  resource_group_name = var.resource_group
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each = var.vnet_map

  name                  = local.private_dns_zone_vnet_link
  private_dns_zone_name = length(var.dns_zone_name) == 0 ? var.external_dns_zone_name : azurerm_private_dns_zone.this[0].name
  resource_group_name   = var.resource_group
  virtual_network_id    = each.value
  tags                  = var.tags

  lifecycle {
    precondition {
      condition     = length(var.dns_zone_name) == 0 && length(var.external_dns_zone_name) == 0 ? false : true
      error_message = "Provide either 'dns_zone_name' value to create new Private DNS Zone or 'external_dns_zone_name' value to create link with already existing Private DNS Zone"
    }
  }
}
