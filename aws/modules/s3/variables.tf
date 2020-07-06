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