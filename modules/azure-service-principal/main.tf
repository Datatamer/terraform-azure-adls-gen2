resource "azuread_application" "adls-gen2-application" {
  display_name     = var.application_name
  sign_in_audience = "AzureADMyOrg"

  # Required resource blocks added via adding permissions from the portal
  # TODO: Learn more about these blocks, IDs are mysterious
  # Blob storage
  required_resource_access {
    resource_app_id = "e406a681-f3d4-42a8-90b6-c2b029497af1"

    resource_access {
      id   = "03e0da56-190b-40ad-a80c-ea378c433f7f"
      type = "Scope"
    }
  }
  web {
    implicit_grant {
      access_token_issuance_enabled = true
    }
  }
}

resource "azuread_service_principal" "adls-gen2-service-principal" {
  application_id               = azuread_application.adls-gen2-application.application_id
  app_role_assignment_required = true

  tags = var.tags
}

resource "azurerm_role_assignment" "service-principal-role-assigment" {
  count = length(var.role_scopes)

  scope                = var.role_scopes[count.index]
  role_definition_name = "Storage Account Contributor"
  principal_id         = azuread_service_principal.adls-gen2-service-principal.id
}

resource "azurerm_role_assignment" "service-principal-role-assigment2" {
  count = length(var.role_scopes)

  scope                = var.role_scopes[count.index]
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_service_principal.adls-gen2-service-principal.id
}

resource "azuread_service_principal_password" "sp-secret" {
  service_principal_id = azuread_service_principal.adls-gen2-service-principal.id
  display_name         = "For accessing ADLS Gen2"
  end_date             = var.client_secr_expiration_date
}

# For tenant ID
data "azurerm_client_config" "current" {
}
