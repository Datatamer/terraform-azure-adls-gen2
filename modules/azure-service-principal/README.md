# Tamr Azure Service Principal module

This terraform module creates a service principal

## Assumptions
* A resource group exists

# Examples
## Basic
`terraform apply`

main.tf:
```
module "service-principal" {
  source = "git::https://github.com/Datatamer/terraform-azure-adls-gen2.git//modules/azure-service-principal?ref=0.3.0"

  application_name            = "example-sp"
  role_scopes                 = [azurerm_storage_account.adls-gen2-storage.id]
  client_secr_expiration_date = "2022-01-01T01:02:03Z"

  tags = ["sp-example-tag"]
}
```

## service-principal
Smallest complete fully working example with a service principal. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-adls-gen2/tree/master/examples/service-principal)

# Resources Created
This modules creates:
* An Azure app registration
* A service principal
* A service principal secret

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
| client\_secr\_expiration\_date | Expiration date of service principal secret formatted as a RFC3339 date string | `string` | `"2099-01-01T01:02:03Z"` | no |
| role\_scopes | List of resource IDs to include in scope of role assignment | `list(string)` | <pre>[<br>  "WindowsAzureActiveDirectoryIntegratedApp"<br>]</pre> | no |
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
