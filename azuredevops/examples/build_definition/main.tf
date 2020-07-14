module "build_definition" {
  source = "../../modules/build_definition"

  # Azure Devops project
  enable_project      = true
  project_name        = "poc-avtocreating-ado-project"
  project_visability  = "private"
  version_control     = "Git"
  work_item_template  = "Agile"
  enable_artifacts    = "disabled"
  enable_boards       = "disabled"
  enable_pipelines    = "enabled"
  enable_repositories = "disabled"
  enable_testplans    = "disabled"

  #-----------------------------------------------------------
  # Azure Devops azuredevops_serviceendpoint_github
  #-----------------------------------------------------------
  enable_serviceendpoint_github                = true
  serviceendpoint_github_service_endpoint_name = "poc-avtocreating-ado-test"

  #-----------------------------------------------------------
  # Azure Devops azuredevops_build_definition
  #-----------------------------------------------------------
  enable_build_definition          = true
  build_definition_name            = "poc-avtocreating-ado-project-build-definition"
  build_definition_agent_pool_name = "Hosted Ubuntu 1604"
  enable_use_yaml_ci_trigger       = true
  build_definition_repo_type       = "GitHub"
  build_definition_repo_id         = "Kudenchuk/poc-avtocreating-ado-project"
  build_definition_branch_name     = "master"
  build_definition_yml_path        = ".azdo/azure-pipelines.yml"
}
