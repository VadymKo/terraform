terraform {
  required_version = "~> 0.12.24"
  required_providers {
    azuredevops = ">= 0.0.1"
  }
}

provider "azuredevops" {
  version = ">= 0.0.1"
  # org_service_url = ""  AZDO_ORG_SERVICE_URL environment variable
  # personal_access_token = "" # AZDO_PERSONAL_ACCESS_TOKEN environment variable
}