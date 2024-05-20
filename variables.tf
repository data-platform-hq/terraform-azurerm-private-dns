variable "dns_zone_name" {
  type        = string
  description = "The name of the Private DNS Zone that needs to be created or linked to the virtual network"
}

variable "resource_group" {
  type        = string
  description = "Resource group where Private DNS zone would be created or it is already exists"
}

variable "create_private_dns_zone" {
  type        = bool
  description = "Boolean flag that determines whether Private DNS Zones is created by this module"
  default     = true
}

variable "private_dns_a_records" {
  type = list(object({
    name    = string
    ttl     = optional(number, 300)
    records = list(string)
  }))
  description = "List of objects with parameters to create A Record in Private DNS Zone"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}

variable "vnet_map" {
  type        = map(string)
  description = "Map of Virtual Network Name to Id, used to create VNet Link to Private DNS"
  default     = {}
}
