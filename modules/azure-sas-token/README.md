# Tamr Azure SAS token module

This terraform module creates a Shared Access Signature for an existing storage account

## Assumptions
* A resource group exists
* A storage account exists for which the token will be created

# Examples
## Basic
`terraform apply`

main.tf:
```
module "sas-token" {
  source = "git::https://github.com/Datatamer/terraform-azure-adls-gen2.git//modules/azure-sas-token?ref=x.y.z"

  storage_account_primary_connection_string = azurerm_storage_account.adls2_storage.primary_connection_string
  start_time                                = "2021-01-1T00:00:00Z"
  end_time                                  = "2021-12-31T00:00:00Z"
}
```

## SAS token
Smallest complete fully working example with a SAS Token. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-adls-gen2/tree/master/examples/minimal)

# Resources Created
This modules creates no new resources

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azuread | >= 1.5.0 |
| azurerm | >= 2.60.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.60.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| end\_time | The expiration time and date of this SAS. Must be a valid ISO-8601 format time/date string | `string` | n/a | yes |
| start\_time | The starting time and date of validity of this SAS. Must be a valid ISO-8601 format time/date string | `string` | n/a | yes |
| storage\_account\_primary\_connection\_string | Primary connection string associated with the storage account for which the token will be created | `string` | n/a | yes |
| delete\_allowed | Whether or not to give this token permission to delete blobs | `bool` | `false` | no |
| signed\_version | Specifies the signed storage service version to use to authorize requests made with this account SAS | `string` | `"2017-07-29"` | no |

## Outputs

| Name | Description |
|------|-------------|
| sas\_url\_query\_string | Token for client usage |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
