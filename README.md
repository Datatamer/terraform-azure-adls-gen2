# Terraform Module Template
This is a template github repo, for a terraform module. A new terraform module, should use this as its starting point.
This repo follows the [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure).

# Examples
## Basic
Inline example implementation of the module.  This is the most basic example of what it would look like to use this module.
```
module "minimal" {
  source = "git::https://github.com/Datatamer/terraform-azure-adls-gen2?ref=x.y.z"

  instance_name = "tamradlsgen2"
  resource_group_name = "example-resource-group"
  location = "East US 2"
}
```
## Minimal
Smallest complete fully working example. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-azure-adls-gen2/tree/master/examples/minimal)

# Resources Created
This modules creates:
* 1 Azure storage account
* 1 ADLS Gen2 filesystem container

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
| instance\_name | Name of ADLS Gen2 instance (lowercase and numbers only, must be fewer than 18 characters.) | `string` | n/a | yes |
| location | Location of resource group | `string` | n/a | yes |
| resource\_group\_name | Name of resource group | `string` | n/a | yes |
| access\_tier | Storage account access tier | `string` | `"Hot"` | no |
| account\_kind | Storage account kind | `string` | `"StorageV2"` | no |
| fs\_properties | Map of additional properties to assign to the Gen2 filesystem | `map(string)` | `null` | no |
| replication\_type | Storage account replication type | `string` | `"RAGRS"` | no |

## Outputs

| Name | Description |
|------|-------------|
| gen2\_fs\_id | ID of the ADLS Gen2 filesystem |
| gen2\_fs\_name | Name of the ADLS Gen2 filesystem |
| storage\_account\_id | ID of the ADLS Gen2 storage account |
| storage\_account\_name | Name of the ADLS Gen2 storage account |
| storage\_account\_primary\_access\_key | Primary access key for the ADLS Gen2 storage account |
| storage\_account\_primary\_connection\_string | Primary connection string for the ADLS Gen2 storage account |
| storage\_account\_primary\_dfs\_enpoint | Primary DFS endpoint for the ADLS Gen2 storage account |
| storage\_account\_primary\_dfs\_host | Hostname and port for DFS storage for the ADLS Gen2 storage account |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References
This repo is based on:
* [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure)
* [templated terraform module](https://github.com/tmknom/template-terraform-module)

Storage account redundancy:
https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy

ADLS Gen2 storage accounts must be Standard tier:
https://www.terraform.io/docs/providers/azurerm/r/storage_account.html#is_hns_enabled

# Development
## Generating Docs
Run `make terraform/docs` to generate the section of docs around terraform inputs, outputs and requirements.

## Checkstyles
Run `make lint`, this will run terraform fmt, in addition to a few other checks to detect whitespace issues.
NOTE: this requires having docker working on the machine running the test

## Releasing new versions
* Update version contained in `VERSION`
* Document changes in `CHANGELOG.md`
* Create a tag in github for the commit associated with the version

# License
Apache 2 Licensed. See LICENSE for full details.
