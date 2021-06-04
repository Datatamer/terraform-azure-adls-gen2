# Tamr Azure Storage Account Network Rules module

This terraform module creates Network Rules for an Azure storage account

## Assumptions
* An Azure storage account already exists

# Examples
## Basic
`terraform apply`

main.tf:
```
module "storage_network_rules_module" {
  source = "git::https://github.com/Datatamer/terraform-azure-adls-gen2.git//modules/azure-storage-account-network-rules?ref=x.y.z"

  storage_account_name = "tamrExampleAdlsGen2
  resource_group_name = "exampleAdlsGen2ResourceGroup"
  allowed_ips = ["4.3.2.1"]
  allowed_subnet_ids = [azurerm_subnet.example-adls-subnet.id]
}
```

## Minimal
Smallest complete fully working example. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-adls-gen2/tree/master/examples/minimal)

# Resources Created
This modules creates:
* N network rules matching input

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | >= 2.60.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.60.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource\_group\_name | Name of resource group containing the storage account | `string` | n/a | yes |
| storage\_account\_name | Name of storage account on which to create rules | `string` | n/a | yes |
| allowed\_ips | List of allowed IPs | `list(string)` | `null` | no |
| allowed\_subnet\_ids | List of allowed subnet IDs. Subnets must have Microsoft.Storage service endpoint | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| network\_rules\_id | ID of the ADLS Gen2 storage account network rules |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
