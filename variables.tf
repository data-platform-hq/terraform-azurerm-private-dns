variable "create_private_zone" {
  type        = bool
  description = "Condition for Private DNS Zone creation"
}

variable "resource_group" {
  type        = string
  description = "Azure location"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}

variable "dns_zone_name" {
  type        = string
  description = "Name of Private DNS Zone"
  default     = "privatelink.azuredatabricks.net"
}

variable "vnet_map" {
  type        = map(string)
  description = "Map of Virtual Network Name to Id, used to create VNet Link to Private DNS"
  default     = {}
}

variable "external_dns_zone_name" {
  type        = string
  description = "Name of Imported Private DNS Zone. Provide value in case creation of new Private DNS Zone is disabled"
  default     = ""
}
