# Tamr Azure Service Principal module

This terraform module creates a service principal scoped to a resource group

## Assumptions
* A resource group exists

# Examples
## Basic
`terraform apply`

main.tf:
```
module "service-principal" {
  source = "git::https://github.com/Datatamer/terraform-azure-adls-gen2.git//modules/azure-service-principal?ref=0.1.0"

  application_name       = "example-sp"
  resource_group_id      = azurerm_resource_group.adls-gen2-rg.id
  client_secr_expiration_date = "2022-01-01T01:02:03Z"

  tags = ["sp-example-tag"]
}
```

## service-principal
Smallest complete fully working example with a service principal. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-adls-gen2/tree/master/examples/service-principal)

# Resources Created
This modules creates:
* A service principal

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| azuread | n/a |
| azurerm | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application\_name | Name for application registration for the service principal | `string` | n/a | yes |
| resource\_group\_id | ID of resource group for service principal scope | `string` | n/a | yes |
| client\_secr\_expiration\_date | Expiration date of service principal secret formatted as a RFC3339 date string | `string` | `"2099-01-01T01:02:03Z"` | no |
| tags | List of addition tags to attach to the service principal | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| azuread\_application | Service Principal Application |
| azuread\_service\_principal\_password | Service principal secret |
| client-id | Service principal client ID |
| service-principal | Storage service principal |
| tenant-id | Service principal tenant ID |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
