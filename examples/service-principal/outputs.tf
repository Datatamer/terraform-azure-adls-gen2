output "gen2-module" {
  value       = module.minimal
  description = "All resources created by the ADLS Gen2 module"
}

output "service-principal" {
  value       = module.service-principal
  description = "All resources created by the service principal module"
}
