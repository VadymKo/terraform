#-----------------------------------------------------------
# Azure Devops project
#-----------------------------------------------------------
variable "enable_project" {
  description = "Enable to create Azure Devops project by default"
  default     = false
}

variable "project_name" {
  description = "The Project Name."
  default     = null
}

variable "project_visability" {
  description = "Specifies the visibility of the Project. Valid values: private or public."
  default     = "private"
}

variable "version_control" {
  description = "Specifies the version control system. Valid values: Git or Tfvc."
  default     = "Git"
}

variable "work_item_template" {
  description = "Specifies the work item template. Defaults to Agile."
  default     = "Agile"
}

variable "enable_artifacts" {
  description = "Defines the status (enabled, disabled) of the project features. Valid features boards, repositories, pipelines, testplans, artifacts"
  default     = "disabled"
}

variable "enable_boards" {
  description = "Defines the status (enabled, disabled) of the project features. Valid features boards, repositories, pipelines, testplans, artifacts"
  default     = "disabled"
}

variable "enable_pipelines" {
  description = "Defines the status (enabled, disabled) of the project features. Valid features boards, repositories, pipelines, testplans, artifacts"
  default     = "disabled"
}

variable "enable_repositories" {
  description = "Defines the status (enabled, disabled) of the project features. Valid features boards, repositories, pipelines, testplans, artifacts"
  default     = "disabled"
}

variable "enable_testplans" {
  description = "Defines the status (enabled, disabled) of the project features. Valid features boards, repositories, pipelines, testplans, artifacts"
  default     = "disabled"
}

#-----------------------------------------------------------
# Azure Devops azuredevops_serviceendpoint_github
#-----------------------------------------------------------
variable "enable_serviceendpoint_github" {
  description = "Enable to create Azure Devops serviceendpoint github by default"
  default     = false
}

variable "serviceendpoint_github_service_endpoint_name" {
  description = "The Service Endpoint name."
  default     = null
}

variable "serviceendpoint_github_description" {
  description = "The Service Endpoint description."
  default     = "Managed by Terraform"
}

#-----------------------------------------------------------
# Azure Devops azuredevops_build_definition
#-----------------------------------------------------------
variable "enable_build_definition" {
  description = "Enable to create Azure Devops build definition by default"
  default     = false
}

variable "project_id" {
  description = "The project ID or project name."
  default     = null
}

variable "build_definition_name" {
  description = "The name of the build definition."
  default     = null
}

variable "build_definition_agent_pool_name" {
  description = "The agent pool that should execute the build."
  default     = "Hosted Ubuntu 1604"
}

variable "enable_use_yaml_ci_trigger" {
  description = "Use the azure-pipeline file for the build configuration."
  default     = false
}

variable "build_definition_repo_type" {
  description = "The repository type. Valid values: GitHub or TfsGit or Bitbucket."
  default     = "GitHub"
}
variable "build_definition_repo_id" {
  description = "The id of the repository. For TfsGit repos, this is simply the ID of the repository. For Github repos, this will take the form of <GitHub Org>/<Repo Name>. For Bitbucket repos, this will take the form of <Workspace ID>/<Repo Name>."
  default     = null
}
variable "build_definition_branch_name" {
  description = "The branch name for which builds are triggered."
  default     = "master"
}
variable "build_definition_service_connection_id" {
  description = "The service connection ID. Used if the repo_type is GitHub."
  default     = null
}
variable "build_definition_yml_path" {
  description = "The path of the Yaml file describing the build definition."
  default     = "azure-pipelines.yml"
}

