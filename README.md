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

| Name                                                                      | Version   |
| ------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | >= 3.40.0 |

## Providers

| Name                                                          | Version |
| ------------------------------------------------------------- | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.40.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                        | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [azurerm_private_dns_zone.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone)                                           | resource |
| [azurerm_private_dns_zone_virtual_network_link.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name                                                                                                                                   | Description                                                                                           | Type          | Default | Required |
| -------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group)                                                         | The Azure Region in which all resources in this example should be created.                            | `string`      | n/a     |   yes    |
| <a name="input_custom_dns_zone_vnet_link_name"></a> [custom\_dns\_zone\_vnet\_link\_name](#input\_custom\_dns\_zone\_vnet\_link\_name) | The name of the Private DNS Zone Virtual Network Link                                                 | `string`      | `null`  |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                                                                                         | list of tags                                                                                          | `map(string)` | `{}`    |    no    |
| <a name="input_prefix"></a> [prefix](#input\_prefix)                                                                                   | Custom prefix to add to resource name                                                                 | `string`      | `""`    |    no    |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name)                                                          | Name of Private DNS Zone                                                                              | `string`      | `""`    |    no    |
| <a name="input_vnet_map"></a> [vnet_map](#input\_vnet\_map)                                                                            | Map of Virtual Network Name to Id, used to create VNet Link to Private DNS                            | `map(string)` | `{}`    |    no    |
| <a name="input_external_dns_zone_name"></a> [external\_dns\_zone\_name](#input\_external\_dns\_zone\_name)                             | Name of Imported Private DNS Zone. Provide value in case creation of new Private DNS Zone is disabled | `string`      | `""`    |    no    |

## Outputs

| Name                                                                             | Description                      |
| -------------------------------------------------------------------------------- | -------------------------------- |
| <a name="output_id"></a> [id](#output\_id)                                       | Private DNS Zone Id              |
| <a name="output_name"></a> [name](#output\_name)                                 | Private DNS Zone Name            |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | Private DNS Zone Resource Group  |
| <a name="output_link_id"></a> [link\_id](#output\_link\_id)                      | List of Virtual Network Link Ids |

<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-private-dns/tree/main/LICENSE)
