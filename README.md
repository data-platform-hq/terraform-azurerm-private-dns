# Azure Private DNS Terraform module
Terraform module for creation Azure Private DNS

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version   |
|---------------------------------------------------------------------------|-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | >= 3.40.0 |

## Providers

| Name                                                          | Version |
|---------------------------------------------------------------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.40.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                        | Type     |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [azurerm_private_dns_zone.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone)                                           | resource |
| [azurerm_private_dns_zone_virtual_network_link.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name                                                                                                       | Description                                                                                           | Type          | Default | Required |
|------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|---------------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env)                                                                | The prefix which should be used for all resources in this environment                                 | `string`      | n/a     |   yes    |
| <a name="input_location"></a> [location](#input\_location)                                                 | The Azure Region in which all resources in this example should be created.                            | `string`      | n/a     |   yes    |
| <a name="input_project"></a> [project](#input\_project)                                                    | Project/stream name (e.g. datalake)                                                                   | `string`      | n/a     |   yes    |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group)                             | The Azure Region in which all resources in this example should be created.                            | `string`      | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input\_tags)                                                             | list of tags                                                                                          | `map(string)` | n/a     |   yes    |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name)                              | Name of Private DNS Zone                                                                              | `string`      | `""`    |    no    |
| <a name="input_vnet_map"></a> [vnet_map](#input\_vnet\_map)                                                | Map of Virtual Network Name to Id, used to create VNet Link to Private DNS                            | `map(string)` | `{}`    |    no    |
| <a name="input_external_dns_zone_name"></a> [external\_dns\_zone\_name](#input\_external\_dns\_zone\_name) | Name of Imported Private DNS Zone. Provide value in case creation of new Private DNS Zone is disabled | `string`      | `""`    |    no    |

## Outputs

| Name                                                                             | Description                      |
|----------------------------------------------------------------------------------|----------------------------------|
| <a name="output_id"></a> [id](#output\_id)                                       | Private DNS Zone Id              |
| <a name="output_name"></a> [name](#output\_name)                                 | Private DNS Zone Name            |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | Private DNS Zone Resource Group  |
| <a name="output_link_id"></a> [link\_id](#output\_link\_id)                      | List of Virtual Network Link Ids |

<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-private-dns/tree/main/LICENSE)
