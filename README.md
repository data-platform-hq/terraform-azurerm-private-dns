# Azure Private DNS Terraform module
Terraform module for creation Azure Private DNS

## Usage
This module provides an ability to provision Private DNS Zone and create link between Private DNS Zone and Virtual Network. 

Example on creation of Private DNS Zone within module and linking Virtual Network to it: 
```hcl
data "azurerm_virtual_network" "example" {
  name                = "example_vnet"
  resource_group_name = "example_rg"
}

module "dns" {
  resource_group = "example_rg"
  dns_zone_name  = "privatelink.dfs.core.windows.net"
  vnet_map       = tomap({ 
    (data.azurerm_virtual_network.example.name) = data.azurerm_virtual_network.example.id
  })
  tags = { environment = "dev" }
}
```

Furthermore, it is possible to create link between already existing Private DNS Zone and Virtual Network, thus creating of new Private DNS Zone is actually optional.
```hcl
data "azurerm_virtual_network" "example" {
  name                = "example_vnet"
  resource_group_name = "example_rg"
}

module "dns" {
  resource_group          = "example_rg"
  external_dns_zone_name  = "privatelink.azuredatabricks.net"
  vnet_map                = tomap({
    (data.azurerm_virtual_network.example.name) = data.azurerm_virtual_network.example.id
  })
  tags = { environment = "dev" }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_a_record.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_dns_zone.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_private_dns_zone"></a> [create\_private\_dns\_zone](#input\_create\_private\_dns\_zone) | Boolean flag that determines whether Private DNS Zones is created by this module | `bool` | `true` | no |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | The name of the Private DNS Zone that needs to be created or linked to the virtual network | `string` | n/a | yes |
| <a name="input_private_dns_a_records"></a> [private\_dns\_a\_records](#input\_private\_dns\_a\_records) | List of objects with parameters to create A Record in Private DNS Zone | <pre>list(object({<br>    name    = string<br>    ttl     = optional(number, 300)<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group where Private DNS zone would be created or it is already exists | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `map(string)` | `{}` | no |
| <a name="input_vnet_map"></a> [vnet\_map](#input\_vnet\_map) | Map of Virtual Network Name to Id, used to create VNet Link to Private DNS | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Private DNS Zone Id |
| <a name="output_name"></a> [name](#output\_name) | Private DNS Zone Name |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | Private DNS Zone Resource Group |
| <a name="output_vnet_link_name_to_id_map"></a> [vnet\_link\_name\_to\_id\_map](#output\_vnet\_link\_name\_to\_id\_map) | Map of Virtual Network Link names to it's ids |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-private-dns/tree/main/LICENSE)
