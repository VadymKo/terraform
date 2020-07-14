#---------------------------------
# Azure Devops project
#---------------------------------
output "project_id" {
  description = "The Project ID of the Project."
  value       = element(concat(azuredevops_project.project.*.id, [""]), 0)
}

#-----------------------------------------------------------
# Azure Devops azuredevops_build_definition
#-----------------------------------------------------------
output "build_definition_id" {
  description = "The ID of the build definition"
  value       = element(concat(azuredevops_build_definition.build.*.id, [""]), 0)
}




