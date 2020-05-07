#-----------------------------------------------------------
# Global or/and default variables
#-----------------------------------------------------------
variable "resource_name" {
  description = "Name that is used for resource naming"
  default     = "TEST"
}

#-----------------------------------------------------------
# AWS key_pair
#-----------------------------------------------------------
variable "enable_key_pair" {
  description = "Enable AWS Key pair"
  default     = false
}

variable "key_name" {
  description = "(Optional) The name for the key pair."
  default     = ""
}

variable "public_key" {
  description = "(Required) The public key material."
  default     = ""
}

variable "key_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with key_name."
  default     = "key-"
}

#-----------------------------------------------------------
# Resource tags
#-----------------------------------------------------------
variable "environment_name_tag" {
  description = "Environment name tag. Ex.: DEV, QA, STAGE, PROD"
  default     = "TEST"
}

variable "app_name_tag" {
  description = "APPLICATION name tag."
  default     = "TEST-APP-NAME"
}

variable "service_name_tag" {
  description = "Service name tag."
  default     = "TEST-SERVICE-NAME"
}