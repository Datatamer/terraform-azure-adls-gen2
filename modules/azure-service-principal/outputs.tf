output "azuread_application" {
  value       = azuread_application.adls-gen2-application
  description = "Service Principal Application"
}

output "service-principal" {
  value       = azuread_service_principal.adls-gen2-service-principal
  description = "Storage service principal"
}

output "azuread_service_principal_password" {
  value       = azuread_service_principal_password.sp-secret
  description = "Service principal secret"
}

output "client-id" {
  value       = azuread_service_principal.adls-gen2-service-principal.application_id
  description = "Service principal client ID"
}

output "tenant-id" {
  value       = data.azurerm_client_config.current.tenant_id
  description = "Service principal tenant ID"
}
