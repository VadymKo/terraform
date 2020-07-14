resource "azuredevops_project" "project" {
  count = var.enable_project && var.project_name != "" ? 1 : 0

  project_name       = var.project_name != null ? lower(var.project_name) : null
  visibility         = var.project_visability
  version_control    = var.version_control
  work_item_template = var.work_item_template

  features = {
    "artifacts"    = var.enable_artifacts
    "boards"       = var.enable_boards
    "pipelines"    = var.enable_pipelines
    "repositories" = var.enable_repositories
    "testplans"    = var.enable_testplans
  }
}

resource "azuredevops_serviceendpoint_github" "github_serviceendpoint" {
  count = var.enable_serviceendpoint_github ? 1 : 0

  project_id            = azuredevops_project.project.*.id[0]
  service_endpoint_name = var.serviceendpoint_github_service_endpoint_name
  description           = var.serviceendpoint_github_description
  auth_personal {
    # personalAccessToken = "..." Or set with `AZDO_GITHUB_SERVICE_CONNECTION_PAT` env var
  }
}

resource "azuredevops_build_definition" "build" {
  count = var.enable_project && var.build_definition_name != "" ? 1 : 0

  project_id      = azuredevops_project.project.*.id[0]
  name            = var.build_definition_name != null ? lower(var.build_definition_name) : null
  agent_pool_name = var.build_definition_agent_pool_name

  repository {
    repo_type             = var.build_definition_repo_type
    repo_id               = var.build_definition_repo_id
    branch_name           = var.build_definition_branch_name
    service_connection_id = azuredevops_serviceendpoint_github.github_serviceendpoint.*.id[0]
    yml_path              = var.build_definition_yml_path
  }
}