#-----------------------------------------------------------
# Global or/and default variables
#-----------------------------------------------------------
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "TEST"
}

variable "region" {
  description = "The region where to deploy this code (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment for service"
  default     = "STAGE"
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, etc."
  type        = map(string)
  default     = {}
}

#-----------------------------------------------------------
# S3 bucket
#-----------------------------------------------------------
variable "enable_s3_bucket" {
  description = "Enable to create S3 bucket by default"
  default     = false
}

variable "s3_bucket_name" {
  description = "Name for bucket name. Conflicts with s3_bucket_prefix."
  default     = null
}

variable "s3_bucket_prefix" {
  description = "Creates a unique bucket name beginning with the specified prefix. Conflicts with s3_bucket_name."
  default     = null
}

variable "bucket_policy" {
  description = "(Required) The text of the policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
  default     = null
}

variable "s3_bucket_acl" {
  description = "The canned ACL to apply. Defaults to 'private'."
  default     = "private"
}

variable "s3_bucket_versioning" {
  description = "(Optional) A state of versioning. type = [ { smth = string, smth1 = string } ]"
  default     = []
}

variable "s3_bucket_logging" {
  description = "(Optional) A settings of bucket logging"
  default     = []
}

variable "s3_bucket_website" {
  description = "(Optional) A website object "
  default     = []
}

variable "s3_bucket_force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  default     = false
}

variable "s3_bucket_cors_rule" {
  description = "Cors rules"
  default     = []
}

#-----------------------------------------------------------
# S3 bucket lifecycle_rules
#-----------------------------------------------------------
variable "enable_lifecycle_rule" {
  description = "Enable lifecycle rule"
  default     = false
}

variable "abort_incomplete_multipart_upload_days" {
  description = "(Optional) Specifies the number of days after initiating a multipart upload when the multipart upload must be completed."
  default     = null
}

variable "lifecycle_rule_id" {
  description = "(Optional) Unique identifier for the rule."
  default     = ""
}

variable "lifecycle_rule_prefix" {
  description = "Set prefix for lifecycle rule"
  default     = ""
}

variable "noncurrent_version_expiration_days" {
  description = "(Optional) Specifies when noncurrent object versions expire."
  default     = 90
}

variable "noncurrent_version_transition_days" {
  description = "(Optional) Specifies when noncurrent object versions transitions"
  default     = 30
}

variable "standard_transition_days" {
  description = "Number of days to persist in the standard storage tier before moving to the infrequent access tier"
  default     = 30
}

variable "glacier_transition_days" {
  description = "Number of days after which to move the data to the glacier storage tier"
  default     = 60
}

variable "expiration_days" {
  description = "Number of days after which to expunge the objects"
  default     = 90
}

#-----------------------------------------------------------
# S3 bucket policy
#-----------------------------------------------------------
variable "enable_s3_bucket_policy" {
  description = "Enable s3 bucket policy usage"
  default     = false
}

variable "s3_bucket_policy_bucket" {
  description = "The name of the bucket to which to apply the policy."
  default     = ""
}

variable "s3_bucket_policy" {
  description = "(Required) The text of the policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
  default     = ""
}

#-----------------------------------------------------------
# S3 bucket server_side_encryption_configuration
#-----------------------------------------------------------
# variable "kms_master_key_id" {
#     description = "Set KMS master ket ID"
#     default     = null
# }

# variable "sse_algorithm" {
#   description   = "(required) The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
#   default       = null
# }

#----------------------------------------------------------
# S3 bucket object_lock
#----------------------------------------------------------
variable "object_lock_enabled" {
  description = "(Required) Indicates whether this bucket has an Object Lock configuration enabled. Valid value is Enabled."
  default     = null
}

variable "default_retention_mode" {
  description = "(Required) The default Object Lock retention mode you want to apply to new objects placed in this bucket. Valid values are GOVERNANCE and COMPLIANCE"
  default     = null
}

variable "default_retention_days" {
  description = "(Optional) The number of days that you want to specify for the default retention period."
  default     = null
}

variable "default_retention_years" {
  description = "(Optional) The number of years that you want to specify for the default retention period."
  default     = null
}