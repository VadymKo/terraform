locals {
  resource_tags = map(
    "env", "${upper(var.environment_name_tag)}",
    "app", "${upper(var.app_name_tag)}",
    "service", "${upper(var.service_name_tag)}",
    "managed_by", "terraform"
  )
}