resource "azuread_application" "adls-gen2-application" {
  name                       = var.application_name
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = "native"

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

resource "random_password" "principal-secret" {
  length  = 64
  special = true
}

resource "azuread_service_principal_password" "sp-secret" {
  service_principal_id = azuread_service_principal.adls-gen2-service-principal.id
  description          = "For accessing ADLS Gen2"
  value                = random_password.principal-secret.result
  end_date             = var.client_secr_expiration_date
}

# For tenant ID
data "azurerm_client_config" "current" {
}
